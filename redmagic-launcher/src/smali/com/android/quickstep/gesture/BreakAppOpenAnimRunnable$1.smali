.class Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable$1;
.super Lcom/android/launcher3/anim/U;
.source "BreakAppOpenAnimRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;


# direct methods
.method constructor <init>(Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable$1;->this$0:Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/U;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable$1;->this$0:Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 7
    .line 8
    const-string p0, "BaseSwipeUpHandler"

    .line 9
    .line 10
    const-string p1, "Break open anim end"

    .line 11
    .line 12
    const-string v0, "QuickStep"

    .line 13
    .line 14
    invoke-static {v0, p0, p1}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string p0, "BaseSwipeUpHandler"

    .line 2
    .line 3
    const-string p1, "Break open anim start"

    .line 4
    .line 5
    const-string v0, "QuickStep"

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
