.class public final synthetic Lcom/android/systemui/shared/condition/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/systemui/shared/condition/Monitor;

.field public final synthetic b:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/condition/Monitor;Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/h;->a:Lcom/android/systemui/shared/condition/Monitor;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/condition/h;->b:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/h;->a:Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/condition/h;->b:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;

    .line 4
    .line 5
    check-cast p1, Lcom/android/systemui/shared/condition/Condition;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/systemui/shared/condition/Monitor;->b(Lcom/android/systemui/shared/condition/Monitor;Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;Lcom/android/systemui/shared/condition/Condition;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
