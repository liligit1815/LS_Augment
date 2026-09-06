.class public final Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;
.super Ljava/lang/Object;
.source "RecentsWindowManager.kt"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowManager;-><init>(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "thumbnailDatas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->access$recentAnimationStopped(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 1

    .line 1
    const-string v0, "controller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->access$recentAnimationStopped(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
