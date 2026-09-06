.class public final synthetic Lcom/android/quickstep/views/k2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/app/ActivityOptions$OnAnimationFinishedListener;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/k2;->a:Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAnimationFinished(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/k2;->a:Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->r(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
