.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;
.super Lkotlin/coroutines/jvm/internal/l;
.source "Zip.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/q<",
        "LI4/e<",
        "-",
        "Lh4/t;",
        ">;[",
        "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.recents.viewmodel.RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3"
    f = "RecentsViewModel.kt"
    l = {
        0x120
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(Ll4/d;)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0, p1}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final invoke(LI4/e;[Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-",
            "Lh4/t;",
            ">;[",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;

    invoke-direct {p0, p3}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;-><init>(Ll4/d;)V

    iput-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->L$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->L$1:Ljava/lang/Object;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LI4/e;

    check-cast p2, [Ljava/lang/Object;

    check-cast p3, Ll4/d;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->invoke(LI4/e;[Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->label:I

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
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->L$0:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LI4/e;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->L$1:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, [Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v1, [Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 36
    .line 37
    sget-object v1, Lh4/t;->a:Lh4/t;

    .line 38
    .line 39
    iput v2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;->label:I

    .line 40
    .line 41
    invoke-interface {p1, v1, p0}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-ne p0, v0, :cond_2

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 49
    .line 50
    return-object p0
.end method
