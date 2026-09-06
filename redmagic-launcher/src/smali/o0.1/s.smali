.class public final Lo0/s;
.super Ljava/lang/Object;
.source "ExtensionEmbeddingBackend.kt"

# interfaces
.implements Lo0/l;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/s$a;,
        Lo0/s$b;,
        Lo0/s$c;,
        Lo0/s$d;,
        Lo0/s$e;
    }
.end annotation


# static fields
.field public static final h:Lo0/s$b;

.field private static volatile i:Lo0/s;

.field private static final j:Ljava/util/concurrent/locks/ReentrantLock;


# instance fields
.field private final b:Landroid/content/Context;

.field private c:Lo0/q;

.field private final d:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lo0/s$e;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lo0/s$c;

.field private final f:Lo0/s$d;

.field private final g:Lh4/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/s$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/s$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/s;->h:Lo0/s$b;

    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lo0/s;->j:Ljava/util/concurrent/locks/ReentrantLock;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lo0/q;)V
    .locals 1

    .line 1
    const-string v0, "applicationContext"

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
    iput-object p1, p0, Lo0/s;->b:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p2, p0, Lo0/s;->c:Lo0/q;

    .line 12
    .line 13
    new-instance p1, Lo0/s$c;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lo0/s$c;-><init>(Lo0/s;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lo0/s;->e:Lo0/s$c;

    .line 19
    .line 20
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 21
    .line 22
    invoke-direct {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Lo0/s;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    iget-object p2, p0, Lo0/s;->c:Lo0/q;

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    invoke-interface {p2, p1}, Lo0/q;->b(Lo0/q$a;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    new-instance p1, Lo0/s$d;

    .line 35
    .line 36
    invoke-direct {p1}, Lo0/s$d;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lo0/s;->f:Lo0/s$d;

    .line 40
    .line 41
    new-instance p1, Lo0/s$f;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Lo0/s$f;-><init>(Lo0/s;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lo0/s;->g:Lh4/e;

    .line 51
    .line 52
    return-void
.end method

.method public static final synthetic c(Lo0/s;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/s;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic d(Lo0/s;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/s;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e()Lo0/s;
    .locals 1

    .line 1
    sget-object v0, Lo0/s;->i:Lo0/s;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic f()Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1

    .line 1
    sget-object v0, Lo0/s;->j:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic g(Lo0/s;)V
    .locals 0

    .line 1
    sput-object p0, Lo0/s;->i:Lo0/s;

    .line 2
    .line 3
    return-void
.end method

.method private final h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/s;->c:Lo0/q;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public a(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lo0/r;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "rules"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lo0/s;->j:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v1, p0, Lo0/s;->f:Lo0/s$d;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lo0/s$d;->d(Ljava/util/Set;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lo0/s;->c:Lo0/q;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lo0/s;->i()Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p1, p0}, Lo0/q;->a(Ljava/util/Set;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_1
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method public b()Lo0/C$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/s;->g:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lo0/C$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public i()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lo0/r;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lo0/s;->j:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lo0/s;->f:Lo0/s$d;

    .line 7
    .line 8
    invoke-virtual {p0}, Lo0/s$d;->c()Lo/b;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public final j()Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lo0/s$e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lo0/s;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method
