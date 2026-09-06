.class final Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2$1;
.super Ljava/lang/Object;
.source "ConditionExtensions.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
.field final synthetic this$0:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2$1;->this$0:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2$1;->emit(ZLl4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final emit(ZLl4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2$1;->this$0:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/condition/Condition;->updateCondition(Z)V

    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method
