.class public final Lcom/android/quickstep/util/unfold/LauncherJankMonitorTransitionProgressListener;
.super Ljava/lang/Object;
.source "LauncherJankMonitorTransitionProgressListener.kt"

# interfaces
.implements LC2/i$a;


# instance fields
.field private final attachedViewProvider:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "attachedViewProvider"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/LauncherJankMonitorTransitionProgressListener;->attachedViewProvider:Ljava/util/function/Supplier;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 0

    .line 1
    const/16 p0, 0x53

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onTransitionProgress(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionStarted()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/LauncherJankMonitorTransitionProgressListener;->attachedViewProvider:Ljava/util/function/Supplier;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/View;

    .line 8
    .line 9
    const/16 v0, 0x53

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
