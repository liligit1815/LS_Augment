.class final Li2/a;
.super Ljava/lang/Object;
.source "DispatcherProvider.kt"


# static fields
.field public static final a:Li2/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Li2/a;

    .line 2
    .line 3
    invoke-direct {v0}, Li2/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Li2/a;->a:Li2/a;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()LF4/E;
    .locals 1

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, "LauncherBg"

    .line 10
    .line 11
    invoke-static {p0, v0}, LF4/P0;->a(ILjava/lang/String;)LF4/m0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
