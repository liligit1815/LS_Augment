.class LF4/K0;
.super LF4/a;
.source "Builders.common.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LF4/a<",
        "Lh4/t;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll4/g;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0, p2}, LF4/a;-><init>(Ll4/g;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method protected f0(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, LF4/a;->getContext()Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, LF4/G;->a(Ll4/g;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method
