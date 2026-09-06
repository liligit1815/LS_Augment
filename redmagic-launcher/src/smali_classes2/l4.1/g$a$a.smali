.class final Ll4/g$a$a;
.super Lkotlin/jvm/internal/p;
.source "CoroutineContext.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll4/g$a;->a(Ll4/g;Ll4/g;)Ll4/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/p<",
        "Ll4/g;",
        "Ll4/g$b;",
        "Ll4/g;",
        ">;"
    }
.end annotation


# static fields
.field public static final h:Ll4/g$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll4/g$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll4/g$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll4/g$a$a;->h:Ll4/g$a$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a(Ll4/g;Ll4/g$b;)Ll4/g;
    .locals 2

    .line 1
    const-string p0, "acc"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "element"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ll4/g$b;->getKey()Ll4/g$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1, p0}, Ll4/g;->E(Ll4/g$c;)Ll4/g;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Ll4/h;->g:Ll4/h;

    .line 20
    .line 21
    if-ne p0, p1, :cond_0

    .line 22
    .line 23
    return-object p2

    .line 24
    :cond_0
    sget-object v0, Ll4/e;->f:Ll4/e$b;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll4/e;

    .line 31
    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    new-instance p1, Ll4/c;

    .line 35
    .line 36
    invoke-direct {p1, p0, p2}, Ll4/c;-><init>(Ll4/g;Ll4/g$b;)V

    .line 37
    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_1
    invoke-interface {p0, v0}, Ll4/g;->E(Ll4/g$c;)Ll4/g;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-ne p0, p1, :cond_2

    .line 45
    .line 46
    new-instance p0, Ll4/c;

    .line 47
    .line 48
    invoke-direct {p0, p2, v1}, Ll4/c;-><init>(Ll4/g;Ll4/g$b;)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_2
    new-instance p1, Ll4/c;

    .line 53
    .line 54
    new-instance v0, Ll4/c;

    .line 55
    .line 56
    invoke-direct {v0, p0, p2}, Ll4/c;-><init>(Ll4/g;Ll4/g$b;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p1, v0, v1}, Ll4/c;-><init>(Ll4/g;Ll4/g$b;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll4/g;

    .line 2
    .line 3
    check-cast p2, Ll4/g$b;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll4/g$a$a;->a(Ll4/g;Ll4/g$b;)Ll4/g;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
