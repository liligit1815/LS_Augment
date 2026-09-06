.class public final synthetic Lcom/android/systemui/shared/condition/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/condition/Condition;

.field public final synthetic h:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/d;->g:Lcom/android/systemui/shared/condition/Condition;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/condition/d;->h:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/d;->g:Lcom/android/systemui/shared/condition/Condition;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/condition/d;->h:Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1;->b(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toFlow$1$callback$1;)Lh4/t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
