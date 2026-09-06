.class LL0/s;
.super Landroid/tracing/perfetto/DataSource;
.source "ViewCaptureDataSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LL0/s$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/tracing/perfetto/DataSource<",
        "Landroid/tracing/perfetto/DataSourceInstance;",
        "Ljava/lang/Void;",
        "LL0/s$b;",
        ">;"
    }
.end annotation


# static fields
.field public static d:Ljava/lang/String; = "android.viewcapture"


# instance fields
.field private final a:Ljava/lang/Runnable;

.field private final b:Ljava/lang/Runnable;

.field private final c:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, LL0/s;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Landroid/tracing/perfetto/DataSource;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LL0/s;->a:Ljava/lang/Runnable;

    .line 7
    .line 8
    iput-object p2, p0, LL0/s;->b:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput-object p3, p0, LL0/s;->c:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void
.end method

.method static bridge synthetic a(LL0/s;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s;->b:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(LL0/s;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(LL0/s;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/s;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public bridge synthetic createIncrementalState(Landroid/tracing/perfetto/CreateIncrementalStateArgs;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LL0/s;->d(Landroid/tracing/perfetto/CreateIncrementalStateArgs;)LL0/s$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public createInstance(Landroid/util/proto/ProtoInputStream;I)Landroid/tracing/perfetto/DataSourceInstance;
    .locals 0

    .line 1
    new-instance p1, LL0/s$a;

    .line 2
    .line 3
    invoke-direct {p1, p0, p0, p2}, LL0/s$a;-><init>(LL0/s;Landroid/tracing/perfetto/DataSource;I)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public d(Landroid/tracing/perfetto/CreateIncrementalStateArgs;)LL0/s$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/tracing/perfetto/CreateIncrementalStateArgs<",
            "Landroid/tracing/perfetto/DataSourceInstance;",
            ">;)",
            "LL0/s$b;"
        }
    .end annotation

    .line 1
    new-instance p0, LL0/s$b;

    .line 2
    .line 3
    invoke-direct {p0}, LL0/s$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
