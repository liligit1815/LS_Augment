.class public final Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "Merge.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/CombinedCondition;->start(Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/q<",
        "LI4/e<",
        "-",
        "Ljava/lang/Boolean;",
        ">;",
        "Ljava/lang/Boolean;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.systemui.shared.condition.CombinedCondition$start$$inlined$flatMapLatest$1"
    f = "CombinedCondition.kt"
    l = {
        0xbd
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $groupedConditions$inlined:Ljava/util/Map;

.field private synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/android/systemui/shared/condition/CombinedCondition;


# direct methods
.method public constructor <init>(Ll4/d;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/Map;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->$groupedConditions$inlined:Ljava/util/Map;

    .line 4
    .line 5
    const/4 p2, 0x3

    .line 6
    invoke-direct {p0, p2, p1}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final invoke(LI4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;

    iget-object v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->$groupedConditions$inlined:Ljava/util/Map;

    invoke-direct {v0, p3, v1, p0}, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;-><init>(Ll4/d;Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/Map;)V

    iput-object p1, v0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    sget-object p0, Lh4/t;->a:Lh4/t;

    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LI4/e;

    check-cast p3, Ll4/d;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->invoke(LI4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->label:I

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
    goto :goto_1

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LI4/e;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ljava/lang/Boolean;

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->$groupedConditions$inlined:Ljava/util/Map;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Ljava/util/Collection;

    .line 55
    .line 56
    invoke-static {v1, v3, v4}, Lcom/android/systemui/shared/condition/CombinedCondition;->access$lazilyEvaluate(Lcom/android/systemui/shared/condition/CombinedCondition;Ljava/util/Collection;Z)LI4/d;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-static {v1}, LI4/f;->p(Ljava/lang/Object;)LI4/d;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :goto_0
    iput v2, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$$inlined$flatMapLatest$1;->label:I

    .line 66
    .line 67
    invoke-static {p1, v1, p0}, LI4/f;->l(LI4/e;LI4/d;Ll4/d;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    if-ne p0, v0, :cond_3

    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_3
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 75
    .line 76
    return-object p0
.end method
