.class public final LM0/b$b;
.super Lcom/google/protobuf/y$a;
.source "FrameData.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "LM0/b;",
        "LM0/b$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, LM0/b;->a()LM0/b;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(LM0/b$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LM0/b$b;-><init>()V

    return-void
.end method


# virtual methods
.method public a(LM0/c$b;)LM0/b$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/b;

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
    invoke-static {v0, p1}, LM0/b;->c(LM0/b;LM0/c;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public b(J)LM0/b$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/b;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, LM0/b;->b(LM0/b;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
