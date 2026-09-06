.class public final LF4/G0;
.super Ljava/lang/Object;
.source "Job.kt"

# interfaces
.implements LF4/b0;
.implements LF4/q;


# static fields
.field public static final g:LF4/G0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LF4/G0;

    .line 2
    .line 3
    invoke-direct {v0}, LF4/G0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LF4/G0;->g:LF4/G0;

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
.method public a(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public dispose()V
    .locals 0

    .line 1
    return-void
.end method

.method public getParent()LF4/u0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "NonDisposableHandle"

    .line 2
    .line 3
    return-object p0
.end method
