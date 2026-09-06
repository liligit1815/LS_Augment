.class public final Ll4/c;
.super Ljava/lang/Object;
.source "CoroutineContextImpl.kt"

# interfaces
.implements Ll4/g;
.implements Ljava/io/Serializable;


# instance fields
.field private final g:Ll4/g;

.field private final h:Ll4/g$b;


# direct methods
.method public constructor <init>(Ll4/g;Ll4/g$b;)V
    .locals 1

    .line 1
    const-string v0, "left"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "element"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll4/c;->g:Ll4/g;

    .line 15
    .line 16
    iput-object p2, p0, Ll4/c;->h:Ll4/g$b;

    .line 17
    .line 18
    return-void
.end method

.method private final a(Ll4/g$b;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Ll4/g$b;->getKey()Ll4/g$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll4/c;->b(Ll4/g$c;)Ll4/g$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final d(Ll4/c;)Z
    .locals 1

    .line 1
    :goto_0
    iget-object v0, p1, Ll4/c;->h:Ll4/g$b;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll4/c;->a(Ll4/g$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p1, p1, Ll4/c;->g:Ll4/g;

    .line 12
    .line 13
    instance-of v0, p1, Ll4/c;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    check-cast p1, Ll4/c;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const-string v0, "null cannot be cast to non-null type kotlin.coroutines.CoroutineContext.Element"

    .line 21
    .line 22
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    check-cast p1, Ll4/g$b;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll4/c;->a(Ll4/g$b;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method private final f()I
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    :goto_0
    iget-object p0, p0, Ll4/c;->g:Ll4/g;

    .line 3
    .line 4
    instance-of v1, p0, Ll4/c;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast p0, Ll4/c;

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_1
    if-nez p0, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0
.end method


# virtual methods
.method public E(Ll4/g$c;)Ll4/g;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g$c<",
            "*>;)",
            "Ll4/g;"
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
    iget-object v0, p0, Ll4/c;->h:Ll4/g$b;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll4/g$b;->b(Ll4/g$c;)Ll4/g$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll4/c;->g:Ll4/g;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v0, p0, Ll4/c;->g:Ll4/g;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll4/g;->E(Ll4/g$c;)Ll4/g;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Ll4/c;->g:Ll4/g;

    .line 24
    .line 25
    if-ne p1, v0, :cond_1

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object v0, Ll4/h;->g:Ll4/h;

    .line 29
    .line 30
    if-ne p1, v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll4/c;->h:Ll4/g$b;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    new-instance v0, Ll4/c;

    .line 36
    .line 37
    iget-object p0, p0, Ll4/c;->h:Ll4/g$b;

    .line 38
    .line 39
    invoke-direct {v0, p1, p0}, Ll4/c;-><init>(Ll4/g;Ll4/g$b;)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;
    .locals 1
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
    const-string v0, "operation"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll4/c;->g:Ll4/g;

    .line 7
    .line 8
    invoke-interface {v0, p1, p2}, Ll4/g;->F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll4/c;->h:Ll4/g$b;

    .line 13
    .line 14
    invoke-interface {p2, p1, p0}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public J(Ll4/g;)Ll4/g;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll4/g$a;->a(Ll4/g;Ll4/g;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll4/g$c;)Ll4/g$b;
    .locals 1
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
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-object v0, p0, Ll4/c;->h:Ll4/g$b;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll4/g$b;->b(Ll4/g$c;)Ll4/g$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object p0, p0, Ll4/c;->g:Ll4/g;

    .line 16
    .line 17
    instance-of v0, p0, Ll4/c;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p0, Ll4/c;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-interface {p0, p1}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-eq p0, p1, :cond_1

    .line 2
    .line 3
    instance-of v0, p1, Ll4/c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll4/c;

    .line 8
    .line 9
    invoke-direct {p1}, Ll4/c;->f()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {p0}, Ll4/c;->f()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll4/c;->d(Ll4/c;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll4/c;->g:Ll4/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll4/c;->h:Ll4/g$b;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr v0, p0

    .line 14
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x5b

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    sget-object v2, Ll4/c$a;->h:Ll4/c$a;

    .line 14
    .line 15
    invoke-virtual {p0, v1, v2}, Ll4/c;->F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x5d

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
