.class public final Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;
.super Lcom/android/systemui/shared/condition/Condition;
.source "ConditionExtensions.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/condition/ConditionExtensionsKt;->toCondition(LI4/d;LF4/I;ILjava/lang/Boolean;)Lcom/android/systemui/shared/condition/Condition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $scope:LF4/I;

.field final synthetic $strategy:I

.field final synthetic $this_toCondition:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private job:LF4/u0;


# direct methods
.method constructor <init>(LF4/I;Ljava/lang/Boolean;LI4/d;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/I;",
            "Ljava/lang/Boolean;",
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$scope:LF4/I;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$this_toCondition:LI4/d;

    .line 4
    .line 5
    iput p4, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$strategy:I

    .line 6
    .line 7
    const/4 p3, 0x0

    .line 8
    invoke-direct {p0, p1, p2, p3}, Lcom/android/systemui/shared/condition/Condition;-><init>(LF4/I;Ljava/lang/Boolean;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final getJob()LF4/u0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->job:LF4/u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartStrategy()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$strategy:I

    .line 2
    .line 3
    return p0
.end method

.method public final setJob(LF4/u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->job:LF4/u0;

    .line 2
    .line 3
    return-void
.end method

.method protected start(Ll4/d;)Ljava/lang/Object;
    .locals 6
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

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$scope:LF4/I;

    .line 2
    .line 3
    new-instance v3, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->$this_toCondition:LI4/d;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v3, p1, p0, v1}, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1$start$2;-><init>(LI4/d;Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;Ll4/d;)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x3

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static/range {v0 .. v5}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->job:LF4/u0;

    .line 19
    .line 20
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 21
    .line 22
    return-object p0
.end method

.method protected stop()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->job:LF4/u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-static {v0, v1, v2, v1}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-object v1, p0, Lcom/android/systemui/shared/condition/ConditionExtensionsKt$toCondition$1;->job:LF4/u0;

    .line 11
    .line 12
    return-void
.end method
