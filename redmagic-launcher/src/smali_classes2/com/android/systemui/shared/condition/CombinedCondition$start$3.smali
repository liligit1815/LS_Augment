.class final Lcom/android/systemui/shared/condition/CombinedCondition$start$3;
.super Ljava/lang/Object;
.source "CombinedCondition.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/CombinedCondition;->start(Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/shared/condition/CombinedCondition;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/condition/CombinedCondition;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Boolean;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    invoke-virtual {p0}, Lcom/android/systemui/shared/condition/Condition;->clearCondition()V

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;->this$0:Lcom/android/systemui/shared/condition/CombinedCondition;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->updateCondition(Z)V

    .line 4
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method

.method public bridge synthetic emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/CombinedCondition$start$3;->emit(Ljava/lang/Boolean;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
