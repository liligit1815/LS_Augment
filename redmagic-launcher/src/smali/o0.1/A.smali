.class public final Lo0/A;
.super Ljava/lang/Object;
.source "SafeActivityEmbeddingComponentProvider.kt"


# instance fields
.field private final a:Ljava/lang/ClassLoader;

.field private final b:Ln0/e;

.field private final c:Landroidx/window/extensions/WindowExtensions;

.field private final d:Lm0/c;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Ln0/e;Landroidx/window/extensions/WindowExtensions;)V
    .locals 1

    .line 1
    const-string v0, "loader"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "consumerAdapter"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "windowExtensions"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lo0/A;->a:Ljava/lang/ClassLoader;

    .line 20
    .line 21
    iput-object p2, p0, Lo0/A;->b:Ln0/e;

    .line 22
    .line 23
    iput-object p3, p0, Lo0/A;->c:Landroidx/window/extensions/WindowExtensions;

    .line 24
    .line 25
    new-instance p2, Lm0/c;

    .line 26
    .line 27
    invoke-direct {p2, p1}, Lm0/c;-><init>(Ljava/lang/ClassLoader;)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lo0/A;->d:Lm0/c;

    .line 31
    .line 32
    return-void
.end method

.method private final A()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$p;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$p;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#setEmbeddingRules is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final B()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$q;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$q;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#setSplitInfoCallback is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final C()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$r;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$r;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#setSplitInfoCallback is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final D()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$s;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#setSplitAttributesCalculator is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final E()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$t;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$t;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "unregisterActivityStackCallback is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final F()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$u;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$u;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "#updateSplitAttributes is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public static final synthetic a(Lo0/A;)Ljava/lang/Class;
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/A;->f()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lo0/A;)Ln0/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/A;->b:Ln0/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lo0/A;)Lm0/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/A;->d:Lm0/c;

    .line 2
    .line 3
    return-object p0
.end method

.method private final d()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lo0/A;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ln0/f;->a:Ln0/f;

    .line 10
    .line 11
    invoke-virtual {v0}, Ln0/f;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lo0/A;->g()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 v2, 0x2

    .line 24
    if-ne v0, v2, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Lo0/A;->h()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 v2, 0x3

    .line 32
    const/4 v3, 0x5

    .line 33
    if-gt v2, v0, :cond_3

    .line 34
    .line 35
    if-ge v0, v3, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Lo0/A;->i()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_3
    if-gt v3, v0, :cond_4

    .line 43
    .line 44
    const v2, 0x7fffffff

    .line 45
    .line 46
    .line 47
    if-gt v0, v2, :cond_4

    .line 48
    .line 49
    invoke-virtual {p0}, Lo0/A;->j()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_4
    return v1
.end method

.method private final f()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lo0/A;->a:Ljava/lang/ClassLoader;

    .line 2
    .line 3
    const-string v0, "androidx.window.extensions.embedding.ActivityEmbeddingComponent"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "loader.loadClass(ACTIVIT\u2026MBEDDING_COMPONENT_CLASS)"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method private final l()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$a;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "WindowExtensions#getActivityEmbeddingComponent is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final m()Z
    .locals 1

    .line 1
    const-string p0, "ActivityStack#getTag is not valid"

    .line 2
    .line 3
    sget-object v0, Lo0/A$b;->h:Lo0/A$b;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final n()Z
    .locals 1

    .line 1
    const-string p0, "ActivityStack#getToken is not valid"

    .line 2
    .line 3
    sget-object v0, Lo0/A$c;->h:Lo0/A$c;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final o()Z
    .locals 1

    .line 1
    const-string p0, "Class AnimationBackground is not valid"

    .line 2
    .line 3
    sget-object v0, Lo0/A$d;->h:Lo0/A$d;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final p()Z
    .locals 1

    .line 1
    const-string p0, "ParentContainerInfo is not valid"

    .line 2
    .line 3
    sget-object v0, Lo0/A$e;->h:Lo0/A$e;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final q()Z
    .locals 1

    .line 1
    const-string p0, "Class WindowAttributes is not valid"

    .line 2
    .line 3
    sget-object v0, Lo0/A$f;->h:Lo0/A$f;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final r()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$g;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "clearActivityStackAttributesCalculator is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final s()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$h;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#clearSplitInfoCallback is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final t()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$i;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "getActivityStackToken is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final u()Z
    .locals 2

    .line 1
    new-instance v0, Lo0/A$j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$j;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v1, v0, p0, v1}, Lu0/a;->g(Ljava/lang/String;Lu4/a;ILjava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final v()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$k;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$k;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "#invalidateTopVisibleSplitAttributes is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final w()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$l;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$l;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ActivityEmbeddingComponent#isActivityEmbedded is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final x()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$m;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$m;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "#pin(unPin)TopActivityStack is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final y()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$n;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "registerActivityStackCallback is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final z()Z
    .locals 1

    .line 1
    new-instance v0, Lo0/A$o;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo0/A$o;-><init>(Lo0/A;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "setActivityStackAttributesCalculator is not valid"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lu0/a;->f(Ljava/lang/String;Lu4/a;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method


# virtual methods
.method public final e()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;
    .locals 2

    .line 1
    invoke-direct {p0}, Lo0/A;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lo0/A;->c:Landroidx/window/extensions/WindowExtensions;

    .line 9
    .line 10
    invoke-interface {p0}, Landroidx/window/extensions/WindowExtensions;->getActivityEmbeddingComponent()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 11
    .line 12
    .line 13
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    :catch_0
    :cond_0
    return-object v1
.end method

.method public final g()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lo0/A;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lo0/A;->w()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lo0/A;->B()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final h()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lo0/A;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lo0/A;->C()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lo0/A;->s()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lo0/A;->D()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final i()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lo0/A;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lo0/A;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lo0/A;->F()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final j()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lo0/A;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lo0/A;->o()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lo0/A;->p()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lo0/A;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Lo0/A;->n()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-direct {p0}, Lo0/A;->t()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-direct {p0}, Lo0/A;->u()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-direct {p0}, Lo0/A;->z()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-direct {p0}, Lo0/A;->r()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-direct {p0}, Lo0/A;->y()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-direct {p0}, Lo0/A;->E()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    invoke-direct {p0}, Lo0/A;->q()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    invoke-direct {p0}, Lo0/A;->x()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_0

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_0
    const/4 p0, 0x0

    .line 82
    return p0
.end method

.method public final k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lo0/A;->d:Lm0/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lm0/c;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lo0/A;->l()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
