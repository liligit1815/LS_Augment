.class Lcom/android/launcher3/q5$w;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->f0(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;

.field final synthetic h:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$w;->h:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/q5$w;->g:Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5$w;->g:Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;->unregister()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/q5$w;->h:Lcom/android/launcher3/q5;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/q5;->s(Lcom/android/launcher3/q5;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/q5$w;->g:Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
