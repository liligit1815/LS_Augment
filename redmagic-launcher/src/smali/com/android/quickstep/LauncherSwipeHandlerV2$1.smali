.class Lcom/android/quickstep/LauncherSwipeHandlerV2$1;
.super Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$duration:J


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;J)V
    .locals 0

    .line 1
    iput-wide p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$1;->val$duration:J

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 3

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$1;->val$duration:J

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/anim/q;->z(Landroid/animation/AnimatorSet;J)Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
