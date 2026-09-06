.class public abstract Lcom/android/systemui/shared/condition/Condition;
.super Ljava/lang/Object;
.source "Condition.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/condition/Condition$Callback;,
        Lcom/android/systemui/shared/condition/Condition$Companion;,
        Lcom/android/systemui/shared/condition/Condition$StartStrategy;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/systemui/shared/condition/Condition$Companion;

.field public static final START_EAGERLY:I = 0x0

.field public static final START_LAZILY:I = 0x1

.field public static final START_WHEN_NEEDED:I = 0x2


# instance fields
.field private _isConditionMet:Ljava/lang/Boolean;

.field private final _scope:LF4/I;

.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/systemui/shared/condition/Condition$Callback;",
            ">;>;"
        }
    .end annotation
.end field

.field private currentJob:LF4/u0;

.field private final isOverridingCondition:Z

.field private final mTag:Ljava/lang/String;

.field private started:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/condition/Condition$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/condition/Condition$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/systemui/shared/condition/Condition;->Companion:Lcom/android/systemui/shared/condition/Condition$Companion;

    .line 8
    .line 9
    return-void
.end method

.method protected constructor <init>(LF4/I;)V
    .locals 7

    .line 1
    const-string v0, "_scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/systemui/shared/condition/Condition;-><init>(LF4/I;Ljava/lang/Boolean;ZILkotlin/jvm/internal/j;)V

    return-void
.end method

.method protected constructor <init>(LF4/I;Ljava/lang/Boolean;)V
    .locals 7

    .line 2
    const-string v0, "_scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/systemui/shared/condition/Condition;-><init>(LF4/I;Ljava/lang/Boolean;ZILkotlin/jvm/internal/j;)V

    return-void
.end method

.method protected constructor <init>(LF4/I;Ljava/lang/Boolean;Z)V
    .locals 1

    const-string v0, "_scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->_scope:LF4/I;

    .line 5
    iput-object p2, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 6
    iput-boolean p3, p0, Lcom/android/systemui/shared/condition/Condition;->isOverridingCondition:Z

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "getSimpleName(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->callbacks:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(LF4/I;Ljava/lang/Boolean;ZILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 9
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 10
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/Condition;-><init>(LF4/I;Ljava/lang/Boolean;Z)V

    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;LW/d;Landroidx/lifecycle/g$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/Condition;->observe$lambda$0(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;LW/d;Landroidx/lifecycle/g$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final observe$lambda$0(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;LW/d;Landroidx/lifecycle/g$a;)V
    .locals 0

    .line 1
    const-string p2, "event"

    .line 2
    .line 3
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p2, Landroidx/lifecycle/g$a;->ON_RESUME:Landroidx/lifecycle/g$a;

    .line 7
    .line 8
    if-ne p3, p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->addCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p2, Landroidx/lifecycle/g$a;->ON_PAUSE:Landroidx/lifecycle/g$a;

    .line 15
    .line 16
    if-ne p3, p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->removeCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method private final sendUpdate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->callbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/android/systemui/shared/condition/Condition$Callback;

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-interface {v1, p0}, Lcom/android/systemui/shared/condition/Condition$Callback;->onConditionChanged(Lcom/android/systemui/shared/condition/Condition;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method


# virtual methods
.method public final addCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V
    .locals 7

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->shouldLog()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "adding callback"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->callbacks:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/android/systemui/shared/condition/Condition;->started:Z

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1, p0}, Lcom/android/systemui/shared/condition/Condition$Callback;->onConditionChanged(Lcom/android/systemui/shared/condition/Condition;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/android/systemui/shared/condition/Condition;->_scope:LF4/I;

    .line 38
    .line 39
    new-instance v4, Lcom/android/systemui/shared/condition/Condition$addCallback$1;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-direct {v4, p0, p1}, Lcom/android/systemui/shared/condition/Condition$addCallback$1;-><init>(Lcom/android/systemui/shared/condition/Condition;Ll4/d;)V

    .line 43
    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    const/4 v6, 0x0

    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-static/range {v1 .. v6}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->currentJob:LF4/u0;

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    iput-boolean p1, p0, Lcom/android/systemui/shared/condition/Condition;->started:Z

    .line 57
    .line 58
    return-void
.end method

.method public final and(Ljava/util/Collection;)Lcom/android/systemui/shared/condition/Condition;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;)",
            "Lcom/android/systemui/shared/condition/Condition;"
        }
    .end annotation

    const-string v0, "others"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    new-instance v0, Lkotlin/jvm/internal/F;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkotlin/jvm/internal/F;-><init>(I)V

    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/F;->a(Ljava/lang/Object;)V

    const/4 v1, 0x0

    .line 2
    new-array v2, v1, [Lcom/android/systemui/shared/condition/Condition;

    invoke-interface {p1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 3
    invoke-virtual {v0, p1}, Lkotlin/jvm/internal/F;->b(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lkotlin/jvm/internal/F;->c()I

    move-result p1

    new-array p1, p1, [Lcom/android/systemui/shared/condition/Condition;

    invoke-virtual {v0, p1}, Lkotlin/jvm/internal/F;->d([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 4
    new-instance v0, Lcom/android/systemui/shared/condition/CombinedCondition;

    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->_scope:LF4/I;

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/condition/CombinedCondition;-><init>(LF4/I;Ljava/util/Collection;I)V

    return-object v0
.end method

.method public final varargs and([Lcom/android/systemui/shared/condition/Condition;)Lcom/android/systemui/shared/condition/Condition;
    .locals 1

    const-string v0, "others"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->and(Ljava/util/Collection;)Lcom/android/systemui/shared/condition/Condition;

    move-result-object p0

    return-object p0
.end method

.method public final clearCondition()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->shouldLog()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "clearing condition"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/systemui/shared/condition/Condition;->sendUpdate()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public abstract getStartStrategy()I
.end method

.method public final getState()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->isConditionSet()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "Invalid"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->isConditionMet()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string p0, "True"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, "False"

    .line 20
    .line 21
    return-object p0
.end method

.method public final getTag()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/condition/Condition;->isOverridingCondition:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "[OVRD]"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 26
    .line 27
    return-object p0
.end method

.method public final isConditionMet()Z
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final isConditionSet()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

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

.method public final isOverridingCondition()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/condition/Condition;->isOverridingCondition:Z

    .line 2
    .line 3
    return p0
.end method

.method public final observe(LW/d;Lcom/android/systemui/shared/condition/Condition$Callback;)Lcom/android/systemui/shared/condition/Condition$Callback;
    .locals 1

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-interface {p1}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/Condition;->observe(Landroidx/lifecycle/g;Lcom/android/systemui/shared/condition/Condition$Callback;)Lcom/android/systemui/shared/condition/Condition$Callback;

    move-result-object p0

    return-object p0
.end method

.method public final observe(Landroidx/lifecycle/g;Lcom/android/systemui/shared/condition/Condition$Callback;)Lcom/android/systemui/shared/condition/Condition$Callback;
    .locals 1

    const-string v0, "lifecycle"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    new-instance v0, Lcom/android/systemui/shared/condition/c;

    invoke-direct {v0, p0, p2}, Lcom/android/systemui/shared/condition/c;-><init>(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;)V

    invoke-virtual {p1, v0}, Landroidx/lifecycle/g;->a(LW/c;)V

    return-object p2
.end method

.method public final or(Ljava/util/Collection;)Lcom/android/systemui/shared/condition/Condition;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/systemui/shared/condition/Condition;",
            ">;)",
            "Lcom/android/systemui/shared/condition/Condition;"
        }
    .end annotation

    const-string v0, "others"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 4
    new-instance p1, Lcom/android/systemui/shared/condition/CombinedCondition;

    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->_scope:LF4/I;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, v1}, Lcom/android/systemui/shared/condition/CombinedCondition;-><init>(LF4/I;Ljava/util/Collection;I)V

    return-object p1
.end method

.method public final varargs or([Lcom/android/systemui/shared/condition/Condition;)Lcom/android/systemui/shared/condition/Condition;
    .locals 1

    const-string v0, "others"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->or(Ljava/util/Collection;)Lcom/android/systemui/shared/condition/Condition;

    move-result-object p0

    return-object p0
.end method

.method public final removeCallback(Lcom/android/systemui/shared/condition/Condition$Callback;)V
    .locals 2

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->shouldLog()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "removing callback"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->callbacks:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/android/systemui/shared/condition/Condition$Callback;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    if-ne v1, p1, :cond_1

    .line 46
    .line 47
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    iget-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->callbacks:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_6

    .line 58
    .line 59
    iget-boolean p1, p0, Lcom/android/systemui/shared/condition/Condition;->started:Z

    .line 60
    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->stop()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->currentJob:LF4/u0;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    if-eqz p1, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-static {p1, v0, v1, v0}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iput-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->currentJob:LF4/u0;

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    iput-boolean p1, p0, Lcom/android/systemui/shared/condition/Condition;->started:Z

    .line 80
    .line 81
    :cond_6
    :goto_1
    return-void
.end method

.method protected final shouldLog()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method protected abstract start(Ll4/d;)Ljava/lang/Object;
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
.end method

.method protected abstract stop()V
.end method

.method protected final updateCondition(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->shouldLog()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Condition;->mTag:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "updating condition to "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/android/systemui/shared/condition/Condition;->_isConditionMet:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/systemui/shared/condition/Condition;->sendUpdate()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
