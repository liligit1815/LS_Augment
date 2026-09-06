.class final Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;
.super Lkotlin/coroutines/jvm/internal/k;
.source "TaskGridNavHelper.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/TaskGridNavHelper;->gridTaskViewIdOffsetPairInTabOrderSequence(IZ)LC4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/k;",
        "Lu4/p<",
        "LC4/g<",
        "-",
        "Lh4/l<",
        "+",
        "Ljava/lang/Integer;",
        "+",
        "Ljava/lang/Integer;",
        ">;>;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.util.TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1"
    f = "TaskGridNavHelper.kt"
    l = {
        0x89
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $initialTaskViewId:I

.field final synthetic $towardsStart:Z

.field I$0:I

.field I$1:I

.field I$2:I

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/util/TaskGridNavHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/TaskGridNavHelper;IZLl4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/TaskGridNavHelper;",
            "IZ",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->this$0:Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$initialTaskViewId:I

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$towardsStart:Z

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/k;-><init>(ILl4/d;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 3
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
    new-instance v0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->this$0:Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$initialTaskViewId:I

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$towardsStart:Z

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0, p2}, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;-><init>(Lcom/android/quickstep/util/TaskGridNavHelper;IZLl4/d;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, v0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final invoke(LC4/g;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC4/g<",
            "-",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LC4/g;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->invoke(LC4/g;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->label:I

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
    iget v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$2:I

    .line 13
    .line 14
    iget v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$1:I

    .line 15
    .line 16
    iget v4, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$0:I

    .line 17
    .line 18
    iget-object v5, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->L$0:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v5, LC4/g;

    .line 21
    .line 22
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    move p1, v4

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 30
    .line 31
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->L$0:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p1, LC4/g;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->this$0:Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 43
    .line 44
    iget v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$initialTaskViewId:I

    .line 45
    .line 46
    invoke-static {v1, v3}, Lcom/android/quickstep/util/TaskGridNavHelper;->access$getColumn(Lcom/android/quickstep/util/TaskGridNavHelper;I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iget v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$initialTaskViewId:I

    .line 51
    .line 52
    const/high16 v4, -0x80000000

    .line 53
    .line 54
    move-object v5, p1

    .line 55
    move p1, v1

    .line 56
    :goto_0
    move v1, v3

    .line 57
    if-eq v1, v4, :cond_4

    .line 58
    .line 59
    if-ltz v1, :cond_4

    .line 60
    .line 61
    iget-object v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->this$0:Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 62
    .line 63
    iget-boolean v4, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->$towardsStart:Z

    .line 64
    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    const/4 v4, -0x1

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move v4, v2

    .line 70
    :goto_1
    sget-object v6, Lcom/android/quickstep/util/TaskGridNavHelper$TaskNavDirection;->TAB:Lcom/android/quickstep/util/TaskGridNavHelper$TaskNavDirection;

    .line 71
    .line 72
    const/4 v7, 0x0

    .line 73
    invoke-virtual {v3, v1, v4, v6, v7}, Lcom/android/quickstep/util/TaskGridNavHelper;->getNextGridPage(IILcom/android/quickstep/util/TaskGridNavHelper$TaskNavDirection;Z)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-ltz v3, :cond_3

    .line 78
    .line 79
    if-eq v3, v1, :cond_3

    .line 80
    .line 81
    iget-object v4, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->this$0:Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 82
    .line 83
    invoke-static {v4, v3}, Lcom/android/quickstep/util/TaskGridNavHelper;->access$getColumn(Lcom/android/quickstep/util/TaskGridNavHelper;I)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    sub-int/2addr v4, p1

    .line 88
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    new-instance v6, Lh4/l;

    .line 93
    .line 94
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/b;->b(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/b;->b(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-direct {v6, v7, v4}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    iput-object v5, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->L$0:Ljava/lang/Object;

    .line 106
    .line 107
    iput p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$0:I

    .line 108
    .line 109
    iput v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$1:I

    .line 110
    .line 111
    iput v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->I$2:I

    .line 112
    .line 113
    iput v2, p0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;->label:I

    .line 114
    .line 115
    invoke-virtual {v5, v6, p0}, LC4/g;->b(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    if-ne v4, v0, :cond_3

    .line 120
    .line 121
    return-object v0

    .line 122
    :cond_3
    :goto_2
    move v4, v1

    .line 123
    goto :goto_0

    .line 124
    :cond_4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 125
    .line 126
    return-object p0
.end method
