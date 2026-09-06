.class public abstract Ll4/a;
.super Ljava/lang/Object;
.source "CoroutineContextImpl.kt"

# interfaces
.implements Ll4/g$b;


# instance fields
.field private final g:Ll4/g$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll4/g$c<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll4/g$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g$c<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll4/a;->g:Ll4/g$c;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public E(Ll4/g$c;)Ll4/g;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g$c<",
            "*>;)",
            "Ll4/g;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll4/g$b$a;->c(Ll4/g$b;Ll4/g$c;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lu4/p<",
            "-TR;-",
            "Ll4/g$b;",
            "+TR;>;)TR;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll4/g$b$a;->a(Ll4/g$b;Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public J(Ll4/g;)Ll4/g;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll4/g$b$a;->d(Ll4/g$b;Ll4/g;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll4/g$c;)Ll4/g$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ll4/g$b;",
            ">(",
            "Ll4/g$c<",
            "TE;>;)TE;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll4/g$b$a;->b(Ll4/g$b;Ll4/g$c;)Ll4/g$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getKey()Ll4/g$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll4/g$c<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll4/a;->g:Ll4/g$c;

    .line 2
    .line 3
    return-object p0
.end method
