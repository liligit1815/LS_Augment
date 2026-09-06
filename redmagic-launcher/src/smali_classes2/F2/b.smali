.class public final LF2/b;
.super Ljava/lang/Object;
.source "ATraceLoggerTransitionProgressListener_Factory.java"


# instance fields
.field private final a:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lf4/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF2/b;->a:Lf4/f;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lf4/f;)LF2/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/lang/String;",
            ">;)",
            "LF2/b;"
        }
    .end annotation

    .line 1
    new-instance v0, LF2/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LF2/b;-><init>(Lf4/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)LF2/a;
    .locals 1

    .line 1
    new-instance v0, LF2/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LF2/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(Ljava/lang/String;)LF2/a;
    .locals 0

    .line 1
    iget-object p0, p0, LF2/b;->a:Lf4/f;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, LF2/b;->c(Ljava/lang/String;Ljava/lang/String;)LF2/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
