.class final Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "CombinedCondition.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/CombinedCondition;->lazilyEvaluate(Ljava/util/Collection;Z)LI4/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/p<",
        "LH4/u<",
        "-",
        "Ljava/lang/Boolean;",
        ">;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.systemui.shared.condition.CombinedCondition$lazilyEvaluate$1"
    f = "CombinedCondition.kt"
    l = {
        0x96
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $conditions:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $filterUnknown:Z

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/android/systemui/shared/condition/CombinedCondition;


# direct methods
.method constructor <init>(Ljava/util/Collection;ZLcom/android/systemui/shared/condition/CombinedCondition;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;Z",
            "Lcom/android/systemui/shared/condition/CombinedCondition;",
            "Ll4/d<",
            "-",
            "Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$filterUnknown:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static final synthetic access$invokeSuspend$cancelAllExcept(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$cancelAllExcept(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$invokeSuspend$collectFlow(Ljava/util/List;ZLjava/util/List;LH4/u;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/List;Ljava/util/Collection;I)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$collectFlow(Ljava/util/List;ZLjava/util/List;LH4/u;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/List;Ljava/util/Collection;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$lambda$3(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final invokeSuspend$cancelAllExcept(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LF4/u0;",
            ">;",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_4

    .line 7
    .line 8
    if-ne v1, p3, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 v2, -0x1

    .line 12
    if-eq p3, v2, :cond_1

    .line 13
    .line 14
    invoke-static {p1, v1}, Li4/m;->T(Ljava/lang/Iterable;I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/android/systemui/shared/condition/Condition;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/android/systemui/shared/condition/Condition;->getStartStrategy()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x2

    .line 25
    if-ne v2, v3, :cond_3

    .line 26
    .line 27
    :cond_1
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, LF4/u0;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    invoke-static {v2, v3, v4, v3}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-interface {p0, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    invoke-interface {p2, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_4
    return-void
.end method

.method private static final invokeSuspend$collectFlow(Ljava/util/List;ZLjava/util/List;LH4/u;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/List;Ljava/util/Collection;I)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;>;Z",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;",
            "LH4/u<",
            "-",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/android/systemui/shared/condition/CombinedCondition;",
            "Ljava/util/List<",
            "LF4/u0;",
            ">;",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;I)V"
        }
    .end annotation

    .line 1
    move/from16 v2, p7

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-ne v2, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p4}, Lcom/android/systemui/shared/condition/CombinedCondition;->access$getScope$p(Lcom/android/systemui/shared/condition/CombinedCondition;)LF4/I;

    .line 14
    .line 15
    .line 16
    move-result-object v10

    .line 17
    new-instance v0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1$collectFlow$1;

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    move-object v1, p0

    .line 21
    move v8, p1

    .line 22
    move-object v3, p2

    .line 23
    move-object v5, p3

    .line 24
    move-object v4, p4

    .line 25
    move-object/from16 v6, p5

    .line 26
    .line 27
    move-object/from16 v7, p6

    .line 28
    .line 29
    invoke-direct/range {v0 .. v9}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1$collectFlow$1;-><init>(Ljava/util/List;ILjava/util/List;Lcom/android/systemui/shared/condition/CombinedCondition;LH4/u;Ljava/util/List;Ljava/util/Collection;ZLl4/d;)V

    .line 30
    .line 31
    .line 32
    move p0, v2

    .line 33
    const/4 v5, 0x3

    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v3, 0x0

    .line 37
    move-object v4, v0

    .line 38
    move-object v1, v10

    .line 39
    invoke-static/range {v1 .. v6}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    move-object/from16 v6, p5

    .line 44
    .line 45
    invoke-interface {v6, p0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 50
    .line 51
    invoke-static {p2}, Li4/m;->X(Ljava/lang/Iterable;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    :cond_2
    sget-object p0, Lcom/android/systemui/shared/condition/Evaluator;->INSTANCE:Lcom/android/systemui/shared/condition/Evaluator;

    .line 56
    .line 57
    invoke-static {p4}, Lcom/android/systemui/shared/condition/CombinedCondition;->access$getOperand$p(Lcom/android/systemui/shared/condition/CombinedCondition;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p0, p2, p1}, Lcom/android/systemui/shared/condition/Evaluator;->evaluate$shared_SprdRelease(Ljava/util/Collection;I)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p3, p0}, LH4/x;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private static final invokeSuspend$lambda$3(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;)Lh4/t;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$cancelAllExcept(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;I)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ll4/d<",
            "*>;)",
            "Ll4/d<",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$filterUnknown:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0, p2}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;-><init>(Ljava/util/Collection;ZLcom/android/systemui/shared/condition/CombinedCondition;Ll4/d;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, v0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final invoke(LH4/u;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/u<",
            "-",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LH4/u;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invoke(LH4/u;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_4

    .line 16
    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0

    .line 25
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->L$0:Ljava/lang/Object;

    .line 29
    .line 30
    move-object v6, p1

    .line 31
    check-cast v6, LH4/u;

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    new-instance v8, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v8, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    move v3, v1

    .line 46
    :goto_0
    const/4 v4, 0x0

    .line 47
    if-ge v3, p1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    new-instance v5, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v5, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 64
    .line 65
    .line 66
    move v3, v1

    .line 67
    :goto_1
    if-ge v3, p1, :cond_3

    .line 68
    .line 69
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    add-int/lit8 v3, v3, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 76
    .line 77
    new-instance v3, Ljava/util/ArrayList;

    .line 78
    .line 79
    const/16 v4, 0xa

    .line 80
    .line 81
    invoke-static {p1, v4}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 86
    .line 87
    .line 88
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-eqz v4, :cond_4

    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Lcom/android/systemui/shared/condition/Condition;

    .line 103
    .line 104
    invoke-static {v4}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt;->toFlow(Lcom/android/systemui/shared/condition/Condition;)LI4/d;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 113
    .line 114
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    move v10, v1

    .line 119
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    if-eqz v4, :cond_6

    .line 124
    .line 125
    add-int/lit8 v11, v10, 0x1

    .line 126
    .line 127
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    check-cast v4, Lcom/android/systemui/shared/condition/Condition;

    .line 132
    .line 133
    invoke-virtual {v4}, Lcom/android/systemui/shared/condition/Condition;->getStartStrategy()I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    if-nez v4, :cond_5

    .line 138
    .line 139
    iget-boolean v4, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$filterUnknown:Z

    .line 140
    .line 141
    iget-object v7, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 142
    .line 143
    iget-object v9, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 144
    .line 145
    invoke-static/range {v3 .. v10}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$collectFlow(Ljava/util/List;ZLjava/util/List;LH4/u;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/List;Ljava/util/Collection;I)V

    .line 146
    .line 147
    .line 148
    move v1, v2

    .line 149
    :cond_5
    move v10, v11

    .line 150
    goto :goto_3

    .line 151
    :cond_6
    if-nez v1, :cond_7

    .line 152
    .line 153
    iget-boolean v4, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$filterUnknown:Z

    .line 154
    .line 155
    iget-object v7, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 156
    .line 157
    iget-object v9, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 158
    .line 159
    const/4 v10, 0x0

    .line 160
    invoke-static/range {v3 .. v10}, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->invokeSuspend$collectFlow(Ljava/util/List;ZLjava/util/List;LH4/u;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/List;Ljava/util/Collection;I)V

    .line 161
    .line 162
    .line 163
    :cond_7
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->$conditions:Ljava/util/Collection;

    .line 164
    .line 165
    new-instance v1, Lcom/android/systemui/shared/condition/b;

    .line 166
    .line 167
    invoke-direct {v1, v8, p1, v5}, Lcom/android/systemui/shared/condition/b;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/List;)V

    .line 168
    .line 169
    .line 170
    iput v2, p0, Lcom/android/systemui/shared/condition/CombinedCondition$lazilyEvaluate$1;->label:I

    .line 171
    .line 172
    invoke-static {v6, v1, p0}, LH4/s;->a(LH4/u;Lu4/a;Ll4/d;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    if-ne p0, v0, :cond_8

    .line 177
    .line 178
    return-object v0

    .line 179
    :cond_8
    :goto_4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 180
    .line 181
    return-object p0
.end method
