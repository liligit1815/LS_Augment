.class Lcom/android/systemui/shared/condition/Monitor$1;
.super Ljava/lang/Object;
.source "Monitor.java"

# interfaces
.implements Lcom/android/systemui/shared/condition/Condition$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/condition/Monitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/shared/condition/Monitor;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/condition/Monitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/Monitor$1;->this$0:Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/condition/Monitor$1;Lcom/android/systemui/shared/condition/Condition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/condition/Monitor$1;->lambda$onConditionChanged$0(Lcom/android/systemui/shared/condition/Condition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onConditionChanged$0(Lcom/android/systemui/shared/condition/Condition;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/Monitor$1;->this$0:Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/systemui/shared/condition/Monitor;->h(Lcom/android/systemui/shared/condition/Monitor;Lcom/android/systemui/shared/condition/Condition;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConditionChanged(Lcom/android/systemui/shared/condition/Condition;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/Monitor$1;->this$0:Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/systemui/shared/condition/Monitor;->f(Lcom/android/systemui/shared/condition/Monitor;)Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/systemui/shared/condition/j;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/systemui/shared/condition/j;-><init>(Lcom/android/systemui/shared/condition/Monitor$1;Lcom/android/systemui/shared/condition/Condition;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
