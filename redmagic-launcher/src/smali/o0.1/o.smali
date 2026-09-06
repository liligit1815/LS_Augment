.class public final Lo0/o;
.super Ljava/lang/Object;
.source "EmbeddingCompat.kt"

# interfaces
.implements Lo0/q;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/o$a;
    }
.end annotation


# static fields
.field public static final g:Lo0/o$a;


# instance fields
.field private final a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

.field private final b:Lo0/i;

.field private final c:Ln0/e;

.field private final d:Landroid/content/Context;

.field private final e:Lm0/d;

.field private f:Lo0/x;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/o$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/o$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/o;->g:Lo0/o$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Lo0/i;Ln0/e;Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "embeddingExtension"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "adapter"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "consumerAdapter"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "applicationContext"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lo0/o;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 25
    .line 26
    iput-object p2, p0, Lo0/o;->b:Lo0/i;

    .line 27
    .line 28
    iput-object p3, p0, Lo0/o;->c:Ln0/e;

    .line 29
    .line 30
    iput-object p4, p0, Lo0/o;->d:Landroid/content/Context;

    .line 31
    .line 32
    sget-object p3, Lm0/d;->b:Lm0/d$a;

    .line 33
    .line 34
    invoke-virtual {p3}, Lm0/d$a;->a()Lm0/d;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iput-object p3, p0, Lo0/o;->e:Lm0/d;

    .line 39
    .line 40
    invoke-virtual {p3}, Lm0/d;->b()I

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    const/4 p4, 0x5

    .line 45
    if-lt p3, p4, :cond_0

    .line 46
    .line 47
    new-instance p3, Lo0/x;

    .line 48
    .line 49
    invoke-direct {p3, p1, p2}, Lo0/x;-><init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Lo0/i;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 p3, 0x0

    .line 54
    :goto_0
    iput-object p3, p0, Lo0/o;->f:Lo0/x;

    .line 55
    .line 56
    return-void
.end method

.method public static final synthetic c(Lo0/o;)Lo0/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/o;->b:Lo0/i;

    .line 2
    .line 3
    return-object p0
.end method

.method private final d(Lo0/q$a;)V
    .locals 1

    .line 1
    new-instance v0, Lo0/m;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lo0/m;-><init>(Lo0/q$a;Lo0/o;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lo0/o;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setSplitInfoCallback(Landroidx/window/extensions/core/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
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
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lo0/r;

    .line 21
    .line 22
    instance-of v1, v1, Lo0/H;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    sget-object v0, Lo0/C;->b:Lo0/C$a;

    .line 27
    .line 28
    iget-object v1, p0, Lo0/o;->d:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lo0/C$a;->a(Landroid/content/Context;)Lo0/C;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lo0/C;->a()Lo0/C$b;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lo0/C$b;->c:Lo0/C$b;

    .line 39
    .line 40
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    sget-object p0, Ln0/d;->a:Ln0/d;

    .line 47
    .line 48
    invoke-virtual {p0}, Ln0/d;->a()Ln0/l;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Ln0/l;->h:Ln0/l;

    .line 53
    .line 54
    if-ne p0, p1, :cond_1

    .line 55
    .line 56
    const-string p0, "EmbeddingCompat"

    .line 57
    .line 58
    const-string p1, "Cannot set SplitRule because ActivityEmbedding Split is not supported or PROPERTY_ACTIVITY_EMBEDDING_SPLITS_ENABLED is not set."

    .line 59
    .line 60
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void

    .line 64
    :cond_2
    iget-object v0, p0, Lo0/o;->b:Lo0/i;

    .line 65
    .line 66
    iget-object v1, p0, Lo0/o;->d:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v0, v1, p1}, Lo0/i;->f(Landroid/content/Context;Ljava/util/Set;)Ljava/util/Set;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p0, p0, Lo0/o;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 73
    .line 74
    invoke-interface {p0, p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setEmbeddingRules(Ljava/util/Set;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public b(Lo0/q$a;)V
    .locals 4

    .line 1
    const-string v0, "embeddingCallback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lo0/o;->e:Lm0/d;

    .line 7
    .line 8
    invoke-virtual {v0}, Lm0/d;->b()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lo0/o;->c:Ln0/e;

    .line 16
    .line 17
    iget-object v1, p0, Lo0/o;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 18
    .line 19
    const-class v2, Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Lo0/o$b;

    .line 26
    .line 27
    invoke-direct {v3, p1, p0}, Lo0/o$b;-><init>(Lo0/q$a;Lo0/o;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "setSplitInfoCallback"

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2, p0, v3}, Ln0/e;->a(Ljava/lang/Object;LB4/c;Ljava/lang/String;Lu4/l;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const/4 v1, 0x2

    .line 37
    const/4 v2, 0x5

    .line 38
    if-gt v1, v0, :cond_1

    .line 39
    .line 40
    if-ge v0, v2, :cond_1

    .line 41
    .line 42
    invoke-direct {p0, p1}, Lo0/o;->d(Lo0/q$a;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    if-ne v0, v2, :cond_2

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lo0/o;->d(Lo0/q$a;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Lo0/m;

    .line 52
    .line 53
    invoke-direct {v0, p1, p0}, Lo0/m;-><init>(Lo0/q$a;Lo0/o;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lo0/o;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 57
    .line 58
    new-instance p1, Lc0/b;

    .line 59
    .line 60
    invoke-direct {p1}, Lc0/b;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-interface {p0, p1, v0}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->registerActivityStackCallback(Ljava/util/concurrent/Executor;Landroidx/window/extensions/core/util/function/Consumer;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method
