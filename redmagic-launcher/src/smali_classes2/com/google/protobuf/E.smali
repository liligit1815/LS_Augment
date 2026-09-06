.class public Lcom/google/protobuf/E;
.super Lcom/google/protobuf/F;
.source "LazyField.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/E$c;,
        Lcom/google/protobuf/E$b;
    }
.end annotation


# instance fields
.field private final f:Lcom/google/protobuf/T;


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/E;->f()Lcom/google/protobuf/T;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f()Lcom/google/protobuf/T;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/E;->f:Lcom/google/protobuf/T;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/google/protobuf/F;->c(Lcom/google/protobuf/T;)Lcom/google/protobuf/T;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/E;->f()Lcom/google/protobuf/T;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/E;->f()Lcom/google/protobuf/T;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
