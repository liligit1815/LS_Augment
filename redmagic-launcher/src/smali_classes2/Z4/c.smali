.class LZ4/c;
.super LZ4/b;
.source "RxJavaObservableExecutionHookDefault.java"


# static fields
.field private static a:LZ4/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LZ4/c;

    .line 2
    .line 3
    invoke-direct {v0}, LZ4/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LZ4/c;->a:LZ4/c;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LZ4/b;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()LZ4/b;
    .locals 1

    .line 1
    sget-object v0, LZ4/c;->a:LZ4/c;

    .line 2
    .line 3
    return-object v0
.end method
