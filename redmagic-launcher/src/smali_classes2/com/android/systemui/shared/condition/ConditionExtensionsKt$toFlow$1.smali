.class final Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "ConditionExtensions.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/ConditionExtensionsKt;->toFlow(Lcom/android/systemui/shared/condition/Condition;)LI4/d;
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
    c = "com.android.systemui.shared.condition.ConditionExtensionsKt$toFlow$1"
    f = "ConditionExtensions.kt"
    l = {
        0x34
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $this_toFlow:Lcom/android/systemui/shared/condition/Condition;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/condition/Condition;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/condition/Condition;",
            "Ll4/d<",
            "-",
            "Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->$this_toFlow:Lcom/android/systemui/shared/condition/Condition;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->invokeSuspend$lambda$0(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final invokeSuspend$lambda$0(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->removeCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 1
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
    new-instance v0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->$this_toFlow:Lcom/android/systemui/shared/condition/Condition;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;-><init>(Lcom/android/systemui/shared/condition/Condition;Ll4/d;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->L$0:Ljava/lang/Object;

    .line 9
    .line 10
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
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LH4/u;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->invoke(LH4/u;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->label:I

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
    goto :goto_0

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
    iget-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->L$0:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LH4/u;

    .line 30
    .line 31
    new-instance v1, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;-><init>(LH4/u;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->$this_toFlow:Lcom/android/systemui/shared/condition/Condition;

    .line 37
    .line 38
    invoke-virtual {v3, v1}, Lcom/android/systemui/shared/condition/Condition;->addCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->$this_toFlow:Lcom/android/systemui/shared/condition/Condition;

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;->onConditionChanged(Lcom/android/systemui/shared/condition/Condition;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->$this_toFlow:Lcom/android/systemui/shared/condition/Condition;

    .line 47
    .line 48
    new-instance v4, Lcom/android/systemui/shared/condition/d;

    .line 49
    .line 50
    invoke-direct {v4, v3, v1}, Lcom/android/systemui/shared/condition/d;-><init>(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)V

    .line 51
    .line 52
    .line 53
    iput v2, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->label:I

    .line 54
    .line 55
    invoke-static {p1, v4, p0}, LH4/s;->a(LH4/u;Lu4/a;Ll4/d;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-ne p0, v0, :cond_2

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 63
    .line 64
    return-object p0
.end method
