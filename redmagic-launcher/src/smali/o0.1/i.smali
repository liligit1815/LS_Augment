.class public final Lo0/i;
.super Ljava/lang/Object;
.source "EmbeddingAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/i$a;,
        Lo0/i$b;,
        Lo0/i$c;
    }
.end annotation


# static fields
.field public static final d:Lo0/i$a;

.field private static final e:Landroid/os/Binder;

.field private static final f:Landroid/os/Binder;


# instance fields
.field private final a:Ln0/i;

.field private final b:Lo0/i$b;

.field private final c:Lo0/i$c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/i$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/i$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/i;->d:Lo0/i$a;

    .line 8
    .line 9
    new-instance v0, Landroid/os/Binder;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lo0/i;->e:Landroid/os/Binder;

    .line 15
    .line 16
    new-instance v0, Landroid/os/Binder;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lo0/i;->f:Landroid/os/Binder;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Ln0/i;)V
    .locals 1

    .line 1
    const-string v0, "predicateAdapter"

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
    iput-object p1, p0, Lo0/i;->a:Ln0/i;

    .line 10
    .line 11
    new-instance v0, Lo0/i$b;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lo0/i$b;-><init>(Lo0/i;Ln0/i;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lo0/i;->b:Lo0/i$b;

    .line 17
    .line 18
    new-instance p1, Lo0/i$c;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lo0/i$c;-><init>(Lo0/i;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lo0/i;->c:Lo0/i$c;

    .line 24
    .line 25
    return-void
.end method

.method public static final synthetic a(Lo0/i;)Lo0/i$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b()Landroid/os/Binder;
    .locals 1

    .line 1
    sget-object v0, Lo0/i;->f:Landroid/os/Binder;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic c()Landroid/os/Binder;
    .locals 1

    .line 1
    sget-object v0, Lo0/i;->e:Landroid/os/Binder;

    .line 2
    .line 3
    return-object v0
.end method

.method private final d()I
    .locals 0

    .line 1
    sget-object p0, Lm0/d;->b:Lm0/d$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm0/d$a;->a()Lm0/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lm0/d;->b()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private final g(Landroidx/window/extensions/embedding/SplitInfo;)Lo0/D;
    .locals 5

    .line 1
    invoke-direct {p0}, Lo0/i;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lo0/D;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getPrimaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "splitInfo.primaryActivityStack"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lo0/i;->h(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSecondaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "splitInfo.secondaryActivityStack"

    .line 31
    .line 32
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lo0/i;->h(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSplitAttributes()Landroidx/window/extensions/embedding/SplitAttributes;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "splitInfo.splitAttributes"

    .line 44
    .line 45
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v3}, Lo0/i;->i(Landroidx/window/extensions/embedding/SplitAttributes;)Lo0/B;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getToken()Landroid/os/IBinder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v3, "splitInfo.token"

    .line 57
    .line 58
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v0, v1, v2, p0, p1}, Lo0/D;-><init>(Lo0/c;Lo0/c;Lo0/B;Landroid/os/IBinder;)V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_0
    iget-object p0, p0, Lo0/i;->c:Lo0/i$c;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lo0/i$c;->a(Landroidx/window/extensions/embedding/SplitInfo;)Lo0/D;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_1
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lo0/i$b;->j(Landroidx/window/extensions/embedding/SplitInfo;)Lo0/D;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method private final j(Lo0/b;Ljava/lang/Class;)Landroidx/window/extensions/embedding/ActivityRule;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lo0/b;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroidx/window/extensions/embedding/ActivityRule;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lo0/i;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lo0/i$b;->h(Lo0/b;Ljava/lang/Class;)Landroidx/window/extensions/embedding/ActivityRule;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Lo0/h;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lo0/h;-><init>(Lo0/b;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Lo0/h;

    .line 21
    .line 22
    invoke-direct {p2, p1}, Lo0/h;-><init>(Lo0/b;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroidx/window/extensions/embedding/ActivityRule$Builder;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Landroidx/window/extensions/embedding/ActivityRule$Builder;-><init>(Landroidx/window/extensions/core/util/function/Predicate;Landroidx/window/extensions/core/util/function/Predicate;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lo0/b;->b()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Landroidx/window/extensions/embedding/ActivityRule$Builder;->setShouldAlwaysExpand(Z)Landroidx/window/extensions/embedding/ActivityRule$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p2, "ActivityRuleBuilder(acti\u2026Expand(rule.alwaysExpand)"

    .line 39
    .line 40
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lo0/r;->a()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroidx/window/extensions/embedding/ActivityRule$Builder;->setTag(Ljava/lang/String;)Landroidx/window/extensions/embedding/ActivityRule$Builder;

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Landroidx/window/extensions/embedding/ActivityRule$Builder;->build()Landroidx/window/extensions/embedding/ActivityRule;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "builder.build()"

    .line 57
    .line 58
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-object p0
.end method

.method private final k(Lo0/j;)Landroidx/window/extensions/embedding/AnimationBackground;
    .locals 1

    .line 1
    sget-object p0, Lm0/d;->b:Lm0/d$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm0/d$a;->a()Lm0/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-virtual {p0, v0}, Lm0/d;->c(I)V

    .line 9
    .line 10
    .line 11
    instance-of p0, p1, Lo0/j$a;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p1, Lo0/j$a;

    .line 16
    .line 17
    invoke-virtual {p1}, Lo0/j$a;->a()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Landroidx/window/extensions/embedding/AnimationBackground;->createColorBackground(I)Landroidx/window/extensions/embedding/AnimationBackground$ColorBackground;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "{\n            OEMEmbeddi\u2026ckground.color)\n        }"

    .line 26
    .line 27
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    check-cast p0, Landroidx/window/extensions/embedding/AnimationBackground;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    sget-object p0, Landroidx/window/extensions/embedding/AnimationBackground;->ANIMATION_BACKGROUND_DEFAULT:Landroidx/window/extensions/embedding/AnimationBackground;

    .line 34
    .line 35
    const-string p1, "{\n            OEMEmbeddi\u2026KGROUND_DEFAULT\n        }"

    .line 36
    .line 37
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method private final n(Landroid/content/Context;Lo0/F;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPairRule;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lo0/F;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroidx/window/extensions/embedding/SplitPairRule;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lo0/i;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, p3}, Lo0/i$b;->n(Landroid/content/Context;Lo0/F;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPairRule;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p3, Lo0/f;

    .line 16
    .line 17
    invoke-direct {p3, p2}, Lo0/f;-><init>(Lo0/F;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lo0/f;

    .line 21
    .line 22
    invoke-direct {v0, p2}, Lo0/f;-><init>(Lo0/F;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Lo0/g;

    .line 26
    .line 27
    invoke-direct {v1, p2, p1}, Lo0/g;-><init>(Lo0/F;Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lo0/r;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 35
    .line 36
    invoke-direct {v2, p3, v0, v1}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;-><init>(Landroidx/window/extensions/core/util/function/Predicate;Landroidx/window/extensions/core/util/function/Predicate;Landroidx/window/extensions/core/util/function/Predicate;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Lo0/H;->e()Lo0/B;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p0, p3}, Lo0/i;->m(Lo0/B;)Landroidx/window/extensions/embedding/SplitAttributes;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {v2, p3}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->setDefaultSplitAttributes(Landroidx/window/extensions/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p2}, Lo0/F;->m()Lo0/H$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Lo0/i;->l(Lo0/H$d;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p3, v0}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->setFinishPrimaryWithSecondary(I)Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p2}, Lo0/F;->n()Lo0/H$d;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Lo0/i;->l(Lo0/H$d;)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    invoke-virtual {p3, p0}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->setFinishSecondaryWithPrimary(I)Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p2}, Lo0/F;->k()Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-virtual {p0, p2}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->setShouldClearTop(Z)Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p2, "SplitPairRuleBuilder(\n  \u2026ldClearTop(rule.clearTop)"

    .line 84
    .line 85
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->setTag(Ljava/lang/String;)Landroidx/window/extensions/embedding/SplitPairRule$Builder;

    .line 91
    .line 92
    .line 93
    :cond_1
    invoke-virtual {p0}, Landroidx/window/extensions/embedding/SplitPairRule$Builder;->build()Landroidx/window/extensions/embedding/SplitPairRule;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "builder.build()"

    .line 98
    .line 99
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-object p0
.end method

.method private final o(Landroid/content/Context;Lo0/G;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPlaceholderRule;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lo0/G;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroidx/window/extensions/embedding/SplitPlaceholderRule;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lo0/i;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, p3}, Lo0/i$b;->o(Landroid/content/Context;Lo0/G;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPlaceholderRule;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p3, Lo0/d;

    .line 16
    .line 17
    invoke-direct {p3, p2}, Lo0/d;-><init>(Lo0/G;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lo0/d;

    .line 21
    .line 22
    invoke-direct {v0, p2}, Lo0/d;-><init>(Lo0/G;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Lo0/e;

    .line 26
    .line 27
    invoke-direct {v1, p2, p1}, Lo0/e;-><init>(Lo0/G;Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lo0/r;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;

    .line 35
    .line 36
    invoke-virtual {p2}, Lo0/G;->m()Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v2, v3, p3, v0, v1}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;-><init>(Landroid/content/Intent;Landroidx/window/extensions/core/util/function/Predicate;Landroidx/window/extensions/core/util/function/Predicate;Landroidx/window/extensions/core/util/function/Predicate;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Lo0/G;->n()Z

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    invoke-virtual {v2, p3}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;->setSticky(Z)Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p2}, Lo0/H;->e()Lo0/B;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Lo0/i;->m(Lo0/B;)Landroidx/window/extensions/embedding/SplitAttributes;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p3, v0}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;->setDefaultSplitAttributes(Landroidx/window/extensions/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p2}, Lo0/G;->l()Lo0/H$d;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p0, p2}, Lo0/i;->l(Lo0/H$d;)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    invoke-virtual {p3, p0}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;->setFinishPrimaryWithPlaceholder(I)Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p2, "SplitPlaceholderRuleBuil\u2026holder)\n                )"

    .line 76
    .line 77
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;->setTag(Ljava/lang/String;)Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;

    .line 83
    .line 84
    .line 85
    :cond_1
    invoke-virtual {p0}, Landroidx/window/extensions/embedding/SplitPlaceholderRule$Builder;->build()Landroidx/window/extensions/embedding/SplitPlaceholderRule;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "builder.build()"

    .line 90
    .line 91
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-object p0
.end method

.method private final p(Lo0/B$d;)Landroidx/window/extensions/embedding/SplitAttributes$SplitType;
    .locals 4

    .line 1
    invoke-direct {p0}, Lo0/i;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-lt v0, v1, :cond_3

    .line 7
    .line 8
    sget-object v0, Lo0/B$d;->f:Lo0/B$d;

    .line 9
    .line 10
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance p1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$HingeSplitType;

    .line 17
    .line 18
    sget-object v0, Lo0/B$d;->e:Lo0/B$d;

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lo0/i;->p(Lo0/B$d;)Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-direct {p1, p0}, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$HingeSplitType;-><init>(Landroidx/window/extensions/embedding/SplitAttributes$SplitType;)V

    .line 25
    .line 26
    .line 27
    check-cast p1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_0
    sget-object p0, Lo0/B$d;->d:Lo0/B$d;

    .line 31
    .line 32
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    new-instance p0, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$ExpandContainersSplitType;

    .line 39
    .line 40
    invoke-direct {p0}, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$ExpandContainersSplitType;-><init>()V

    .line 41
    .line 42
    .line 43
    check-cast p0, Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    invoke-virtual {p1}, Lo0/B$d;->a()F

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    float-to-double v0, p0

    .line 51
    const-wide/16 v2, 0x0

    .line 52
    .line 53
    cmpl-double v2, v0, v2

    .line 54
    .line 55
    if-lez v2, :cond_2

    .line 56
    .line 57
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 58
    .line 59
    cmpg-double v0, v0, v2

    .line 60
    .line 61
    if-gez v0, :cond_2

    .line 62
    .line 63
    new-instance p1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$RatioSplitType;

    .line 64
    .line 65
    invoke-direct {p1, p0}, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$RatioSplitType;-><init>(F)V

    .line 66
    .line 67
    .line 68
    check-cast p1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 69
    .line 70
    return-object p1

    .line 71
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v1, "Unsupported SplitType: "

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v1, " with value: "

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Lo0/B$d;->a()F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p0

    .line 106
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 107
    .line 108
    const-string p1, "Failed requirement."

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0
.end method


# virtual methods
.method public final e(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/window/extensions/embedding/SplitInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lo0/D;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "splitInfoList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    const/16 v1, 0xa

    .line 9
    .line 10
    invoke-static {p1, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroidx/window/extensions/embedding/SplitInfo;

    .line 32
    .line 33
    invoke-direct {p0, v1}, Lo0/i;->g(Landroidx/window/extensions/embedding/SplitInfo;)Lo0/D;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v0
.end method

.method public final f(Landroid/content/Context;Ljava/util/Set;)Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Set<",
            "+",
            "Lo0/r;",
            ">;)",
            "Ljava/util/Set<",
            "Landroidx/window/extensions/embedding/EmbeddingRule;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "rules"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lo0/i;->a:Ln0/i;

    .line 12
    .line 13
    invoke-virtual {v0}, Ln0/i;->c()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 25
    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    invoke-static {p2, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_4

    .line 44
    .line 45
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lo0/r;

    .line 50
    .line 51
    instance-of v3, v2, Lo0/F;

    .line 52
    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    check-cast v2, Lo0/F;

    .line 56
    .line 57
    invoke-direct {p0, p1, v2, v0}, Lo0/i;->n(Landroid/content/Context;Lo0/F;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPairRule;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Landroidx/window/extensions/embedding/EmbeddingRule;

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    instance-of v3, v2, Lo0/G;

    .line 65
    .line 66
    if-eqz v3, :cond_2

    .line 67
    .line 68
    check-cast v2, Lo0/G;

    .line 69
    .line 70
    invoke-direct {p0, p1, v2, v0}, Lo0/i;->o(Landroid/content/Context;Lo0/G;Ljava/lang/Class;)Landroidx/window/extensions/embedding/SplitPlaceholderRule;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroidx/window/extensions/embedding/EmbeddingRule;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    instance-of v3, v2, Lo0/b;

    .line 78
    .line 79
    if-eqz v3, :cond_3

    .line 80
    .line 81
    check-cast v2, Lo0/b;

    .line 82
    .line 83
    invoke-direct {p0, v2, v0}, Lo0/i;->j(Lo0/b;Ljava/lang/Class;)Landroidx/window/extensions/embedding/ActivityRule;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Landroidx/window/extensions/embedding/EmbeddingRule;

    .line 88
    .line 89
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    const-string p1, "Unsupported rule type"

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p0

    .line 101
    :cond_4
    invoke-static {v1}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0
.end method

.method public final h(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;
    .locals 3

    .line 1
    const-string v0, "activityStack"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lo0/i;->d()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-gt v1, v0, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lo0/i;->b:Lo0/i$b;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lo0/i$b;->i(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    new-instance p0, Lo0/c;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/ActivityStack;->getActivities()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "activityStack.activities"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/ActivityStack;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/ActivityStack;->getToken()Landroid/os/IBinder;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v2, "activityStack.token"

    .line 43
    .line 44
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0, v0, v1, p1}, Lo0/c;-><init>(Ljava/util/List;ZLandroid/os/IBinder;)V

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method public final i(Landroidx/window/extensions/embedding/SplitAttributes;)Lo0/B;
    .locals 4

    .line 1
    const-string v0, "splitAttributes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lo0/B$a;

    .line 7
    .line 8
    invoke-direct {v0}, Lo0/B$a;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitAttributes;->getSplitType()Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "splitAttributes.splitType"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    instance-of v2, v1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$HingeSplitType;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget-object v1, Lo0/B$d;->f:Lo0/B$d;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    instance-of v2, v1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$ExpandContainersSplitType;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    sget-object v1, Lo0/B$d;->d:Lo0/B$d;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    instance-of v2, v1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$RatioSplitType;

    .line 35
    .line 36
    if-eqz v2, :cond_9

    .line 37
    .line 38
    sget-object v2, Lo0/B$d;->c:Lo0/B$d$a;

    .line 39
    .line 40
    check-cast v1, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$RatioSplitType;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/window/extensions/embedding/SplitAttributes$SplitType$RatioSplitType;->getRatio()F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v2, v1}, Lo0/B$d$a;->b(F)Lo0/B$d;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    invoke-virtual {v0, v1}, Lo0/B$a;->d(Lo0/B$d;)Lo0/B$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitAttributes;->getLayoutDirection()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x5

    .line 59
    if-eqz v1, :cond_6

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    if-eq v1, v3, :cond_5

    .line 63
    .line 64
    const/4 v3, 0x3

    .line 65
    if-eq v1, v3, :cond_4

    .line 66
    .line 67
    const/4 v3, 0x4

    .line 68
    if-eq v1, v3, :cond_3

    .line 69
    .line 70
    if-ne v1, v2, :cond_2

    .line 71
    .line 72
    sget-object v1, Lo0/B$c;->h:Lo0/B$c;

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 76
    .line 77
    new-instance p1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v0, "Unknown layout direction: "

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0

    .line 98
    :cond_3
    sget-object v1, Lo0/B$c;->g:Lo0/B$c;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    sget-object v1, Lo0/B$c;->d:Lo0/B$c;

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    sget-object v1, Lo0/B$c;->f:Lo0/B$c;

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_6
    sget-object v1, Lo0/B$c;->e:Lo0/B$c;

    .line 108
    .line 109
    :goto_1
    invoke-virtual {v0, v1}, Lo0/B$a;->c(Lo0/B$c;)Lo0/B$a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-direct {p0}, Lo0/i;->d()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-lt p0, v2, :cond_8

    .line 118
    .line 119
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitAttributes;->getAnimationBackground()Landroidx/window/extensions/embedding/AnimationBackground;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    const-string p1, "splitAttributes.animationBackground"

    .line 124
    .line 125
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    instance-of p1, p0, Landroidx/window/extensions/embedding/AnimationBackground$ColorBackground;

    .line 129
    .line 130
    if-eqz p1, :cond_7

    .line 131
    .line 132
    sget-object p1, Lo0/j;->a:Lo0/j$b;

    .line 133
    .line 134
    check-cast p0, Landroidx/window/extensions/embedding/AnimationBackground$ColorBackground;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroidx/window/extensions/embedding/AnimationBackground$ColorBackground;->getColor()I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-virtual {p1, p0}, Lo0/j$b;->b(I)Lo0/j$a;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    goto :goto_2

    .line 145
    :cond_7
    sget-object p0, Lo0/j;->b:Lo0/j;

    .line 146
    .line 147
    :goto_2
    invoke-virtual {v0, p0}, Lo0/B$a;->b(Lo0/j;)Lo0/B$a;

    .line 148
    .line 149
    .line 150
    :cond_8
    invoke-virtual {v0}, Lo0/B$a;->a()Lo0/B;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 156
    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    const-string v0, "Unknown split type: "

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    throw p0
.end method

.method public final l(Lo0/H$d;)I
    .locals 2

    .line 1
    const-string p0, "behavior"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lo0/H$d;->d:Lo0/H$d;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    sget-object p0, Lo0/H$d;->e:Lo0/H$d;

    .line 17
    .line 18
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    sget-object p0, Lo0/H$d;->f:Lo0/H$d;

    .line 27
    .line 28
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x2

    .line 35
    return p0

    .line 36
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v1, "Unknown finish behavior:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0
.end method

.method public final m(Lo0/B;)Landroidx/window/extensions/embedding/SplitAttributes;
    .locals 4

    .line 1
    const-string v0, "splitAttributes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lo0/i;->d()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x2

    .line 11
    if-lt v0, v1, :cond_6

    .line 12
    .line 13
    new-instance v0, Landroidx/window/extensions/embedding/SplitAttributes$Builder;

    .line 14
    .line 15
    invoke-direct {v0}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lo0/B;->d()Lo0/B$d;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {p0, v1}, Lo0/i;->p(Lo0/B$d;)Landroidx/window/extensions/embedding/SplitAttributes$SplitType;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;->setSplitType(Landroidx/window/extensions/embedding/SplitAttributes$SplitType;)Landroidx/window/extensions/embedding/SplitAttributes$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Lo0/B;->c()Lo0/B$c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget-object v2, Lo0/B$c;->d:Lo0/B$c;

    .line 35
    .line 36
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/4 v3, 0x5

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget-object v2, Lo0/B$c;->e:Lo0/B$c;

    .line 46
    .line 47
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    sget-object v2, Lo0/B$c;->f:Lo0/B$c;

    .line 56
    .line 57
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    sget-object v2, Lo0/B$c;->g:Lo0/B$c;

    .line 66
    .line 67
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    const/4 v1, 0x4

    .line 74
    goto :goto_0

    .line 75
    :cond_3
    sget-object v2, Lo0/B$c;->h:Lo0/B$c;

    .line 76
    .line 77
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    move v1, v3

    .line 84
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;->setLayoutDirection(I)Landroidx/window/extensions/embedding/SplitAttributes$Builder;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "Builder()\n            .s\u2026          }\n            )"

    .line 89
    .line 90
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Lo0/i;->d()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-lt v1, v3, :cond_4

    .line 98
    .line 99
    invoke-virtual {p0}, Lo0/i;->q()Landroidx/window/extensions/embedding/WindowAttributes;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;->setWindowAttributes(Landroidx/window/extensions/embedding/WindowAttributes;)Landroidx/window/extensions/embedding/SplitAttributes$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1}, Lo0/B;->b()Lo0/j;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-direct {p0, p1}, Lo0/i;->k(Lo0/j;)Landroidx/window/extensions/embedding/AnimationBackground;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v1, p0}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;->setAnimationBackground(Landroidx/window/extensions/embedding/AnimationBackground;)Landroidx/window/extensions/embedding/SplitAttributes$Builder;

    .line 116
    .line 117
    .line 118
    :cond_4
    invoke-virtual {v0}, Landroidx/window/extensions/embedding/SplitAttributes$Builder;->build()Landroidx/window/extensions/embedding/SplitAttributes;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "builder.build()"

    .line 123
    .line 124
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v1, "Unsupported layoutDirection:"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p1, ".layoutDirection"

    .line 144
    .line 145
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p0

    .line 156
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 157
    .line 158
    const-string p1, "Failed requirement."

    .line 159
    .line 160
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    throw p0
.end method

.method public final q()Landroidx/window/extensions/embedding/WindowAttributes;
    .locals 2

    .line 1
    sget-object p0, Lm0/d;->b:Lm0/d$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm0/d$a;->a()Lm0/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-virtual {p0, v0}, Lm0/d;->c(I)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroidx/window/extensions/embedding/WindowAttributes;

    .line 12
    .line 13
    sget-object v0, Lo0/p;->e:Lo0/p;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x1

    .line 25
    :goto_0
    invoke-direct {p0, v0}, Landroidx/window/extensions/embedding/WindowAttributes;-><init>(I)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method
