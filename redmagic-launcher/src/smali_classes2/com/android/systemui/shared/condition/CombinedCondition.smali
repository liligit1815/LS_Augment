.class public final Lcom/android/systemui/shared/condition/CombinedCondition;
.super Lcom/android/systemui/shared/condition/Condition;
.source "CombinedCondition.kt"


# instance fields
.field private final _startStrategy$delegate:Lh4/e;

.field private final conditions:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;"
        }
    .end annotation
.end field

.field private final operand:I

.field private final scope:LF4/I;


# direct methods
.method public constructor <init>(LF4/I;Ljava/util/Collection;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/I;",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const-string v0, "scope"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "conditions"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0, p1, v0, v1}, Lcom/android/systemui/shared/condition/Condition;-><init>(LF4/I;Ljava/lang/Boolean;Z)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->scope:LF4/I;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->conditions:Ljava/util/Collection;

    .line 19
    .line 20
    iput p3, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->operand:I

    .line 21
    .line 22
    new-instance p1, Lcom/android/systemui/shared/condition/a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/android/systemui/shared/condition/a;-><init>(Lcom/android/systemui/shared/condition/CombinedCondition;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->_startStrategy$delegate:Lh4/e;

    .line 32
    .line 33
    return-void
.end method

.method private static final _startStrategy_delegate$lambda$0(Lcom/android/systemui/shared/condition/CombinedCondition;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/condition/CombinedCondition;->calculateStartStrategy()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$getOperand$p(Lcom/android/systemui/shared/condition/CombinedCondition;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->operand:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getScope$p(Lcom/android/systemui/shared/condition/CombinedCondition;)LF4/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->scope:LF4/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$lazilyEvaluate(Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/Collection;Z)LI4/d;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/systemui/shared/condition/CombinedCondition;->lazilyEvaluate(Ljava/util/Collection;Z)LI4/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$shouldEarlyReturn(Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/lang/Boolean;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/condition/CombinedCondition;->shouldEarlyReturn(Ljava/lang/Boolean;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Lcom/android/systemui/shared/condition/CombinedCondition;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/systemui/shared/condition/CombinedCondition;->_startStrategy_delegate$lambda$0(Lcom/android/systemui/shared/condition/CombinedCondition;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final calculateStartStrategy()I
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->conditions:Ljava/util/Collection;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x2

    .line 8
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/android/systemui/shared/condition/Condition;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/systemui/shared/condition/Condition;->getStartStrategy()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eq v1, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v0, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_2
    return v0
.end method

.method private final get_startStrategy()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->_startStrategy$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final lazilyEvaluate(Ljava/util/Collection;Z)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;Z)",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, p0, v1}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;-><init>(Ljava/util/Collection;ZLcom/android/systemui/shared/condition/CombinedCondition;Ll4/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, LI4/f;->c(Lu4/p;)LI4/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private final shouldEarlyReturn(Ljava/lang/Boolean;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->operand:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method


# virtual methods
.method public getStartStrategy()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/condition/CombinedCondition;->get_startStrategy()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected start(Ll4/d;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/CombinedCondition;->conditions:Ljava/util/Collection;

    .line 2
    .line 3
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    move-object v3, v2

    .line 23
    check-cast v3, Lcom/android/systemui/shared/condition/Condition;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/android/systemui/shared/condition/Condition;->isOverridingCondition()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    if-nez v4, :cond_0

    .line 38
    .line 39
    new-instance v4, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :cond_0
    check-cast v4, Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v0, 0x1

    .line 54
    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ljava/util/Collection;

    .line 67
    .line 68
    invoke-direct {p0, v2, v0}, Lcom/android/systemui/shared/condition/CombinedCondition;->lazilyEvaluate(Ljava/util/Collection;Z)LI4/d;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, LI4/f;->i(LI4/d;)LI4/d;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v2, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;

    .line 77
    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-direct {v2, v3, p0, v1}, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;-><init>(Ll4/d;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/Map;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v2}, LI4/f;->s(LI4/d;Lu4/q;)LI4/d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;-><init>(Lcom/android/systemui/shared/condition/CombinedCondition;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, v1, p1}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    if-ne p0, p1, :cond_2

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 103
    .line 104
    return-object p0
.end method

.method protected stop()V
    .locals 0

    .line 1
    return-void
.end method
