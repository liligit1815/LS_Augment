.class LZ4/g;
.super LZ4/f;
.source "RxJavaSingleExecutionHookDefault.java"


# static fields
.field private static final a:LZ4/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LZ4/g;

    .line 2
    .line 3
    invoke-direct {v0}, LZ4/g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LZ4/g;->a:LZ4/g;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LZ4/f;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()LZ4/f;
    .locals 1

    .line 1
    sget-object v0, LZ4/g;->a:LZ4/g;

    .line 2
    .line 3
    return-object v0
.end method
