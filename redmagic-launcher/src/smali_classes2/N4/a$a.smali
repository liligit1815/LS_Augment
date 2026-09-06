.class public final LN4/a$a;
.super Ljava/lang/Object;
.source "Select.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;

.field private final b:Ljava/lang/Object;

.field public final c:Lu4/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/q<",
            "LN4/b<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Lu4/q<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Object;",
            "Ll4/g;",
            "Lh4/t;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/Object;

.field public e:I

.field final synthetic f:LN4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LN4/a<",
            "TR;>;"
        }
    .end annotation
.end field


# virtual methods
.method public final a(LN4/b;Ljava/lang/Object;)Lu4/q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LN4/b<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Lu4/q<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Object;",
            "Ll4/g;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LN4/a$a;->c:Lu4/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, LN4/a$a;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0, p2}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lu4/q;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, LN4/a$a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v1, p0, LN4/a$a;->f:LN4/a;

    .line 4
    .line 5
    instance-of v2, v0, LK4/A;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    check-cast v0, LK4/A;

    .line 11
    .line 12
    iget p0, p0, LN4/a$a;->e:I

    .line 13
    .line 14
    invoke-virtual {v1}, LN4/a;->getContext()Ll4/g;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, p0, v3, v1}, LK4/A;->s(ILjava/lang/Throwable;Ll4/g;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    instance-of p0, v0, LF4/b0;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    move-object v3, v0

    .line 27
    check-cast v3, LF4/b0;

    .line 28
    .line 29
    :cond_1
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-interface {v3}, LF4/b0;->dispose()V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method
