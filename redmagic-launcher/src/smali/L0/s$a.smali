.class LL0/s$a;
.super Landroid/tracing/perfetto/DataSourceInstance;
.source "ViewCaptureDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/s;->createInstance(Landroid/util/proto/ProtoInputStream;I)Landroid/tracing/perfetto/DataSourceInstance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LL0/s;


# direct methods
.method constructor <init>(LL0/s;Landroid/tracing/perfetto/DataSource;I)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/s$a;->g:LL0/s;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Landroid/tracing/perfetto/DataSourceInstance;-><init>(Landroid/tracing/perfetto/DataSource;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected onFlush(Landroid/tracing/perfetto/FlushCallbackArguments;)V
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s$a;->g:LL0/s;

    .line 2
    .line 3
    invoke-static {p0}, LL0/s;->a(LL0/s;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected onStart(Landroid/tracing/perfetto/StartCallbackArguments;)V
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s$a;->g:LL0/s;

    .line 2
    .line 3
    invoke-static {p0}, LL0/s;->b(LL0/s;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected onStop(Landroid/tracing/perfetto/StopCallbackArguments;)V
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s$a;->g:LL0/s;

    .line 2
    .line 3
    invoke-static {p0}, LL0/s;->c(LL0/s;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
