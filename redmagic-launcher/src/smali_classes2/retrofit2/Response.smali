.class public final Lretrofit2/Response;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final body:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final errorBody:LO4/H;

.field private final rawResponse:LO4/G;


# direct methods
.method private constructor <init>(LO4/G;Ljava/lang/Object;LO4/H;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/G;",
            "TT;",
            "LO4/H;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 5
    .line 6
    iput-object p2, p0, Lretrofit2/Response;->body:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Lretrofit2/Response;->errorBody:LO4/H;

    .line 9
    .line 10
    return-void
.end method

.method public static error(ILO4/H;)Lretrofit2/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "LO4/H;",
            ")",
            "Lretrofit2/Response<",
            "TT;>;"
        }
    .end annotation

    const/16 v0, 0x190

    if-lt p0, v0, :cond_0

    .line 1
    new-instance v0, LO4/G$a;

    invoke-direct {v0}, LO4/G$a;-><init>()V

    .line 2
    invoke-virtual {v0, p0}, LO4/G$a;->g(I)LO4/G$a;

    move-result-object p0

    sget-object v0, LO4/C;->i:LO4/C;

    .line 3
    invoke-virtual {p0, v0}, LO4/G$a;->o(LO4/C;)LO4/G$a;

    move-result-object p0

    new-instance v0, LO4/E$a;

    invoke-direct {v0}, LO4/E$a;-><init>()V

    const-string v1, "http://localhost/"

    .line 4
    invoke-virtual {v0, v1}, LO4/E$a;->h(Ljava/lang/String;)LO4/E$a;

    move-result-object v0

    invoke-virtual {v0}, LO4/E$a;->b()LO4/E;

    move-result-object v0

    invoke-virtual {p0, v0}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    move-result-object p0

    .line 5
    invoke-virtual {p0}, LO4/G$a;->c()LO4/G;

    move-result-object p0

    .line 6
    invoke-static {p1, p0}, Lretrofit2/Response;->error(LO4/H;LO4/G;)Lretrofit2/Response;

    move-result-object p0

    return-object p0

    .line 7
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "code < 400: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static error(LO4/H;LO4/G;)Lretrofit2/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LO4/H;",
            "LO4/G;",
            ")",
            "Lretrofit2/Response<",
            "TT;>;"
        }
    .end annotation

    if-eqz p0, :cond_2

    if-eqz p1, :cond_1

    .line 8
    invoke-virtual {p1}, LO4/G;->z()Z

    move-result v0

    if-nez v0, :cond_0

    .line 9
    new-instance v0, Lretrofit2/Response;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p0}, Lretrofit2/Response;-><init>(LO4/G;Ljava/lang/Object;LO4/H;)V

    return-object v0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "rawResponse should not be successful response"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 11
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "rawResponse == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 12
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "body == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Ljava/lang/Object;)Lretrofit2/Response;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lretrofit2/Response<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LO4/G$a;

    invoke-direct {v0}, LO4/G$a;-><init>()V

    const/16 v1, 0xc8

    .line 2
    invoke-virtual {v0, v1}, LO4/G$a;->g(I)LO4/G$a;

    move-result-object v0

    const-string v1, "OK"

    .line 3
    invoke-virtual {v0, v1}, LO4/G$a;->l(Ljava/lang/String;)LO4/G$a;

    move-result-object v0

    sget-object v1, LO4/C;->i:LO4/C;

    .line 4
    invoke-virtual {v0, v1}, LO4/G$a;->o(LO4/C;)LO4/G$a;

    move-result-object v0

    new-instance v1, LO4/E$a;

    invoke-direct {v1}, LO4/E$a;-><init>()V

    const-string v2, "http://localhost/"

    .line 5
    invoke-virtual {v1, v2}, LO4/E$a;->h(Ljava/lang/String;)LO4/E$a;

    move-result-object v1

    invoke-virtual {v1}, LO4/E$a;->b()LO4/E;

    move-result-object v1

    invoke-virtual {v0, v1}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, LO4/G$a;->c()LO4/G;

    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lretrofit2/Response;->success(Ljava/lang/Object;LO4/G;)Lretrofit2/Response;

    move-result-object p0

    return-object p0
.end method

.method public static success(Ljava/lang/Object;LO4/G;)Lretrofit2/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "LO4/G;",
            ")",
            "Lretrofit2/Response<",
            "TT;>;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 17
    invoke-virtual {p1}, LO4/G;->z()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    new-instance v0, Lretrofit2/Response;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, v1}, Lretrofit2/Response;-><init>(LO4/G;Ljava/lang/Object;LO4/H;)V

    return-object v0

    .line 19
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "rawResponse must be successful response"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "rawResponse == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Ljava/lang/Object;LO4/w;)Lretrofit2/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "LO4/w;",
            ")",
            "Lretrofit2/Response<",
            "TT;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 8
    new-instance v0, LO4/G$a;

    invoke-direct {v0}, LO4/G$a;-><init>()V

    const/16 v1, 0xc8

    .line 9
    invoke-virtual {v0, v1}, LO4/G$a;->g(I)LO4/G$a;

    move-result-object v0

    const-string v1, "OK"

    .line 10
    invoke-virtual {v0, v1}, LO4/G$a;->l(Ljava/lang/String;)LO4/G$a;

    move-result-object v0

    sget-object v1, LO4/C;->i:LO4/C;

    .line 11
    invoke-virtual {v0, v1}, LO4/G$a;->o(LO4/C;)LO4/G$a;

    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, LO4/G$a;->j(LO4/w;)LO4/G$a;

    move-result-object p1

    new-instance v0, LO4/E$a;

    invoke-direct {v0}, LO4/E$a;-><init>()V

    const-string v1, "http://localhost/"

    .line 13
    invoke-virtual {v0, v1}, LO4/E$a;->h(Ljava/lang/String;)LO4/E$a;

    move-result-object v0

    invoke-virtual {v0}, LO4/E$a;->b()LO4/E;

    move-result-object v0

    invoke-virtual {p1, v0}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, LO4/G$a;->c()LO4/G;

    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Lretrofit2/Response;->success(Ljava/lang/Object;LO4/G;)Lretrofit2/Response;

    move-result-object p0

    return-object p0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "headers == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public body()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->body:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public code()I
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/G;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public errorBody()LO4/H;
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->errorBody:LO4/H;

    .line 2
    .line 3
    return-object p0
.end method

.method public headers()LO4/w;
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/G;->n()LO4/w;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isSuccessful()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/G;->z()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public message()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/G;->t()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public raw()LO4/G;
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/Response;->rawResponse:LO4/G;

    .line 2
    .line 3
    return-object p0
.end method
