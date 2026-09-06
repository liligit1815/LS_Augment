.class final Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "RecentsViewModelHelper.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsViewModelHelper;->switchToScreenshot(Lcom/android/quickstep/views/TaskView;Ljava/util/Map;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/p<",
        "LF4/I;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.views.RecentsViewModelHelper$switchToScreenshot$1"
    f = "RecentsViewModelHelper.kt"
    l = {
        0x30,
        0x31,
        0x32
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $onFinishRunnable:Ljava/lang/Runnable;

.field final synthetic $taskView:Lcom/android/quickstep/views/TaskView;

.field final synthetic $updatedThumbnails:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation
.end field

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/views/RecentsViewModelHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsViewModelHelper;Ljava/util/Map;Lcom/android/quickstep/views/TaskView;Ljava/lang/Runnable;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewModelHelper;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;",
            "Lcom/android/quickstep/views/TaskView;",
            "Ljava/lang/Runnable;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->this$0:Lcom/android/quickstep/views/RecentsViewModelHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$updatedThumbnails:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$taskView:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$onFinishRunnable:Ljava/lang/Runnable;

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 6
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
    new-instance v0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->this$0:Lcom/android/quickstep/views/RecentsViewModelHelper;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$updatedThumbnails:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$taskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$onFinishRunnable:Ljava/lang/Runnable;

    .line 10
    .line 11
    move-object v5, p2

    .line 12
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;-><init>(Lcom/android/quickstep/views/RecentsViewModelHelper;Ljava/util/Map;Lcom/android/quickstep/views/TaskView;Ljava/lang/Runnable;Ll4/d;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final invoke(LF4/I;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/I;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    const/4 v3, 0x2

    .line 9
    const/4 v4, 0x1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    if-eq v1, v4, :cond_2

    .line 13
    .line 14
    if-eq v1, v3, :cond_1

    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    goto :goto_3

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 23
    .line 24
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw p0

    .line 30
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->this$0:Lcom/android/quickstep/views/RecentsViewModelHelper;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewModelHelper;->access$getRecentsViewModel$p(Lcom/android/quickstep/views/RecentsViewModelHelper;)Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput v4, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->label:I

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->waitForRunningTaskShowScreenshotToUpdate(Ll4/d;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-ne p1, v0, :cond_4

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->this$0:Lcom/android/quickstep/views/RecentsViewModelHelper;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewModelHelper;->access$getRecentsViewModel$p(Lcom/android/quickstep/views/RecentsViewModelHelper;)Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$updatedThumbnails:Ljava/util/Map;

    .line 63
    .line 64
    iput v3, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->label:I

    .line 65
    .line 66
    invoke-virtual {p1, v1, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->waitForThumbnailsToUpdate(Ljava/util/Map;Ll4/d;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-ne p1, v0, :cond_5

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_5
    :goto_1
    invoke-static {}, LF4/Z;->c()LF4/E0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, LF4/E0;->f0()LF4/E0;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v1, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1$1;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$taskView:Lcom/android/quickstep/views/TaskView;

    .line 84
    .line 85
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->$onFinishRunnable:Ljava/lang/Runnable;

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    invoke-direct {v1, v3, v4, v5}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1$1;-><init>(Lcom/android/quickstep/views/TaskView;Ljava/lang/Runnable;Ll4/d;)V

    .line 89
    .line 90
    .line 91
    iput v2, p0, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;->label:I

    .line 92
    .line 93
    invoke-static {p1, v1, p0}, LF4/h;->e(Ll4/g;Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    if-ne p0, v0, :cond_6

    .line 98
    .line 99
    :goto_2
    return-object v0

    .line 100
    :cond_6
    :goto_3
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 101
    .line 102
    return-object p0
.end method
