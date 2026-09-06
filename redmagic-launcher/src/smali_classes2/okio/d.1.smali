.class final Lokio/d;
.super Ljava/lang/Object;
.source "Okio.kt"

# interfaces
.implements Lokio/z;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public flush()V
    .locals 0

    .line 1
    return-void
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    sget-object p0, Lokio/C;->NONE:Lokio/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public write(Lokio/e;J)V
    .locals 0

    .line 1
    const-string p0, "source"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Lokio/e;->skip(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
