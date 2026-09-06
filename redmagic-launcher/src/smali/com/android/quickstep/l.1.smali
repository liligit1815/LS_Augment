.class public final synthetic Lcom/android/quickstep/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/AbsSwipeUpHandler;

.field public final synthetic h:Lcom/android/quickstep/RecentsAnimationTargets;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/l;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/l;->h:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/l;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/l;->h:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->R(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
