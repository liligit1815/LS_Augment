.class public final LM0/d$b;
.super Lcom/google/protobuf/y$a;
.source "WindowData.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "LM0/d;",
        "LM0/d$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, LM0/d;->a()LM0/d;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(LM0/d$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LM0/d$b;-><init>()V

    return-void
.end method


# virtual methods
.method public a(LM0/b$b;)LM0/d$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/d;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, LM0/b;

    .line 13
    .line 14
    invoke-static {v0, p1}, LM0/d;->b(LM0/d;LM0/b;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public b(Ljava/lang/String;)LM0/d$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, LM0/d;

    .line 7
    .line 8
    invoke-static {v0, p1}, LM0/d;->c(LM0/d;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
