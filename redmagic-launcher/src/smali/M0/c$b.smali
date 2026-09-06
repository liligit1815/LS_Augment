.class public final LM0/c$b;
.super Lcom/google/protobuf/y$a;
.source "ViewNode.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM0/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "LM0/c;",
        "LM0/c$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, LM0/c;->a()LM0/c;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(LM0/c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LM0/c$b;-><init>()V

    return-void
.end method


# virtual methods
.method public a(LM0/c$b;)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, LM0/c;

    .line 13
    .line 14
    invoke-static {v0, p1}, LM0/c;->t(LM0/c;LM0/c;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public b(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->o(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public c(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->b(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public d(Z)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->q(LM0/c;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public f(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->s(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public h(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->l(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public i(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->g(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public k(Ljava/lang/String;)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->c(LM0/c;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public l(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->d(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public m(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->m(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public n(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->n(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public o(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->h(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public p(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->i(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public q(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->e(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public r(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->j(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public s(F)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->k(LM0/c;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public t(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->r(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public u(I)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->f(LM0/c;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public v(Z)LM0/c$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/c;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/c;->p(LM0/c;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
