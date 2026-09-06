.class final LF4/X0;
.super Ljava/lang/Object;
.source "CoroutineContext.kt"

# interfaces
.implements Ll4/g$b;
.implements Ll4/g$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll4/g$b;",
        "Ll4/g$c<",
        "LF4/X0;",
        ">;"
    }
.end annotation


# static fields
.field public static final g:LF4/X0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LF4/X0;

    .line 2
    .line 3
    invoke-direct {v0}, LF4/X0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LF4/X0;->g:LF4/X0;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
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
    return-object p0
.end method
