.class public final Ly3/a;
.super Ljava/lang/Object;
.source "EmptyMSDLPlayer.kt"

# interfaces
.implements Ly3/c;


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
.method public a(Lw3/e;Ly3/b;)V
    .locals 0

    .line 1
    const-string p0, "token"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lz3/a;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Empty MSDL player without a vibrator."

    .line 2
    .line 3
    return-object p0
.end method
