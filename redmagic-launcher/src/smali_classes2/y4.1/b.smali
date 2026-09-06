.class public final Ly4/b;
.super Ly4/a;
.source "PlatformRandom.kt"


# instance fields
.field private final i:Ly4/b$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly4/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ly4/b$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ly4/b$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ly4/b;->i:Ly4/b$a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public d()Ljava/util/Random;
    .locals 1

    .line 1
    iget-object p0, p0, Ly4/b;->i:Ly4/b$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "get(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Ljava/util/Random;

    .line 13
    .line 14
    return-object p0
.end method
