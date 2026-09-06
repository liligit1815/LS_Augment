.class final LL0/c$f;
.super Ljava/lang/Object;
.source "PerfettoViewCapture.kt"

# interfaces
.implements Landroid/tracing/perfetto/TraceFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/c;->o(JLjava/lang/String;LL0/n$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DataSourceInstanceType:",
        "Landroid/tracing/perfetto/DataSourceInstance;",
        "TlsStateType:",
        "Ljava/lang/Object;",
        "IncrementalStateType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/tracing/perfetto/TraceFunction;"
    }
.end annotation


# instance fields
.field final synthetic a:LL0/c;

.field final synthetic b:J

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:LL0/n$b;


# direct methods
.method constructor <init>(LL0/c;JLjava/lang/String;LL0/n$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/c$f;->a:LL0/c;

    .line 2
    .line 3
    iput-wide p2, p0, LL0/c$f;->b:J

    .line 4
    .line 5
    iput-object p4, p0, LL0/c$f;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, LL0/c$f;->d:LL0/n$b;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final trace(Landroid/tracing/perfetto/TracingContext;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/tracing/perfetto/TracingContext<",
            "Landroid/tracing/perfetto/DataSourceInstance;",
            "Ljava/lang/Void;",
            "LL0/s$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v5, LL0/c$b;

    .line 2
    .line 3
    iget-object v0, p0, LL0/c$f;->a:LL0/c;

    .line 4
    .line 5
    invoke-direct {v5, v0}, LL0/c$b;-><init>(LL0/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/tracing/perfetto/TracingContext;->newTracePacket()Landroid/util/proto/ProtoOutputStream;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-wide v2, 0x10400000008L

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    iget-wide v6, p0, LL0/c$f;->b:J

    .line 18
    .line 19
    invoke-virtual {v1, v2, v3, v6, v7}, Landroid/util/proto/ProtoOutputStream;->write(JJ)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LL0/c$f;->a:LL0/c;

    .line 23
    .line 24
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, LL0/c$f;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p0, LL0/c$f;->d:LL0/n$b;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/tracing/perfetto/TracingContext;->getIncrementalState()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const-string v6, "getIncrementalState(...)"

    .line 36
    .line 37
    invoke-static {v4, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    check-cast v4, LL0/s$b;

    .line 41
    .line 42
    invoke-static/range {v0 .. v5}, LL0/c;->u(LL0/c;Landroid/util/proto/ProtoOutputStream;Ljava/lang/String;LL0/n$b;LL0/s$b;LL0/c$b;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, LL0/c$f;->a:LL0/c;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/tracing/perfetto/TracingContext;->getIncrementalState()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    check-cast p1, LL0/s$b;

    .line 55
    .line 56
    invoke-static {p0, v1, p1, v5}, LL0/c;->t(LL0/c;Landroid/util/proto/ProtoOutputStream;LL0/s$b;LL0/c$b;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
