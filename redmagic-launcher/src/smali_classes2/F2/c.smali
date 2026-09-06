.class public final LF2/c;
.super Ljava/lang/Object;
.source "ATraceLoggerTransitionProgressListener_Factory_Impl.java"

# interfaces
.implements LF2/a$a;


# instance fields
.field private final a:LF2/b;


# direct methods
.method constructor <init>(LF2/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF2/c;->a:LF2/b;

    .line 5
    .line 6
    return-void
.end method

.method public static b(LF2/b;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF2/b;",
            ")",
            "Lf4/f<",
            "LF2/a$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LF2/c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LF2/c;-><init>(LF2/b;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)LF2/a;
    .locals 0

    .line 1
    iget-object p0, p0, LF2/c;->a:LF2/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LF2/b;->b(Ljava/lang/String;)LF2/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
