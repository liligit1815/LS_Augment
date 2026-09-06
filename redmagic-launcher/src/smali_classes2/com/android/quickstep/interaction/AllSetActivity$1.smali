.class Lcom/android/quickstep/interaction/AllSetActivity$1;
.super Ljava/lang/Object;
.source "AllSetActivity.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/AllSetActivity;->setUpBackgroundAnimation(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/AllSetActivity;

.field final synthetic val$vibrationEffect:Landroid/os/VibrationEffect;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/AllSetActivity;Landroid/os/VibrationEffect;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->val$vibrationEffect:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/AllSetActivity$1;Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity$1;->lambda$onAnimationRepeat$1(Landroid/os/VibrationEffect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/interaction/AllSetActivity$1;Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity$1;->lambda$onAnimationStart$0(Landroid/os/VibrationEffect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationRepeat$1(Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->h(Lcom/android/quickstep/interaction/AllSetActivity;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$onAnimationStart$0(Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->h(Lcom/android/quickstep/interaction/AllSetActivity;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->h(Lcom/android/quickstep/interaction/AllSetActivity;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/util/Q2;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/Q2;-><init>(Landroid/os/Vibrator;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/android/quickstep/interaction/AllSetActivity;->i(Lcom/android/quickstep/interaction/AllSetActivity;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->h(Lcom/android/quickstep/interaction/AllSetActivity;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/util/Q2;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/Q2;-><init>(Landroid/os/Vibrator;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/android/quickstep/interaction/AllSetActivity;->i(Lcom/android/quickstep/interaction/AllSetActivity;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->val$vibrationEffect:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/interaction/h;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/interaction/h;-><init>(Lcom/android/quickstep/interaction/AllSetActivity$1;Landroid/os/VibrationEffect;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v1}, Lcom/android/quickstep/interaction/AllSetActivity;->i(Lcom/android/quickstep/interaction/AllSetActivity;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->this$0:Lcom/android/quickstep/interaction/AllSetActivity;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$1;->val$vibrationEffect:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/interaction/i;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/interaction/i;-><init>(Lcom/android/quickstep/interaction/AllSetActivity$1;Landroid/os/VibrationEffect;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v1}, Lcom/android/quickstep/interaction/AllSetActivity;->i(Lcom/android/quickstep/interaction/AllSetActivity;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
