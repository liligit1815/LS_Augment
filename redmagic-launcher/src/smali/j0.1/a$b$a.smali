.class public final Lj0/a$b$a;
.super Ljava/lang/Object;
.source "Collect.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lj0/a$b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/e<",
        "Lp0/c;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lj0/a;


# direct methods
.method public constructor <init>(Lj0/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/a$b$a;->g:Lj0/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lp0/c;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    check-cast p1, Lp0/c;

    .line 2
    .line 3
    iget-object p0, p0, Lj0/a$b$a;->g:Lj0/a;

    .line 4
    .line 5
    invoke-static {p0}, Lj0/a;->b(Lj0/a;)Lj0/a$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {p0, p1}, Lj0/a$a;->a(Lp0/c;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 17
    .line 18
    :goto_0
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-ne p0, p1, :cond_1

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 26
    .line 27
    return-object p0
.end method
