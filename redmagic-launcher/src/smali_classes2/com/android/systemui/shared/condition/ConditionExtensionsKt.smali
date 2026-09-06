.class public final Lcom/android/systemui/shared/condition/ConditionExtensionsKt;
.super Ljava/lang/Object;
.source "ConditionExtensions.kt"


# direct methods
.method public static final toCondition(LI4/d;LF4/I;I)Lcom/android/systemui/shared/condition/Condition;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;",
            "LF4/I;",
            "I)",
            "Lcom/android/systemui/shared/condition/Condition;"
        }
    .end annotation

    .line 1
    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-static/range {v1 .. v6}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt;->toCondition$default(LI4/d;LF4/I;ILjava/lang/Boolean;ILjava/lang/Object;)Lcom/android/systemui/shared/condition/Condition;

    move-result-object p0

    return-object p0
.end method

.method public static final toCondition(LI4/d;LF4/I;ILjava/lang/Boolean;)Lcom/android/systemui/shared/condition/Condition;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;",
            "LF4/I;",
            "I",
            "Ljava/lang/Boolean;",
            ")",
            "Lcom/android/systemui/shared/condition/Condition;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    new-instance v0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;

    invoke-direct {v0, p1, p3, p0, p2}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;-><init>(LF4/I;Ljava/lang/Boolean;LI4/d;I)V

    return-object v0
.end method

.method public static synthetic toCondition$default(LI4/d;LF4/I;ILjava/lang/Boolean;ILjava/lang/Object;)Lcom/android/systemui/shared/condition/Condition;
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt;->toCondition(LI4/d;LF4/I;ILjava/lang/Boolean;)Lcom/android/systemui/shared/condition/Condition;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static final toFlow(Lcom/android/systemui/shared/condition/Condition;)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/condition/Condition;",
            ")",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p0, v1}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;-><init>(Lcom/android/systemui/shared/condition/Condition;Ll4/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LI4/f;->c(Lu4/p;)LI4/d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, LI4/f;->i(LI4/d;)LI4/d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
