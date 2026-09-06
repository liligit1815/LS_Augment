.class public final Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "OverviewCommandHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper;->executeWhenRecentsIsNotVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field final synthetic $onCallbackResult:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/quickstep/OverviewCommandHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/OverviewCommandHelper;Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lcom/android/quickstep/OverviewCommandHelper;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$onCallbackResult:Lu4/a;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "switching to Overview state - onAnimationEnd: "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OverviewCommandHelper"

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/android/quickstep/OverviewCommandHelper;->access$onRecentsViewFocusUpdated(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$onCallbackResult:Lu4/a;

    .line 41
    .line 42
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string p0, "executeCommand: successfully switched return"

    .line 46
    .line 47
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "switching to Overview state - onAnimationStart: "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "OverviewCommandHelper"

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/android/quickstep/OverviewCommandHelper;->access$updateRecentsViewFocus(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$animatorListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 43
    .line 44
    invoke-static {p1, p0}, Lcom/android/quickstep/OverviewCommandHelper;->access$logShowOverviewFrom(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
