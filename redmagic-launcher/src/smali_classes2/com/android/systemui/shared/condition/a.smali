.class public final synthetic Lcom/android/systemui/shared/condition/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/condition/CombinedCondition;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/condition/CombinedCondition;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/a;->g:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/a;->g:Lcom/android/systemui/shared/condition/CombinedCondition;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/systemui/shared/condition/CombinedCondition;->b(Lcom/android/systemui/shared/condition/CombinedCondition;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
