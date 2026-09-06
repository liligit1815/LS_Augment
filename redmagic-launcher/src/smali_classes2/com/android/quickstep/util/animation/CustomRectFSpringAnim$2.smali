.class Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;
.super Ljava/lang/Object;
.source "CustomRectFSpringAnim.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initProperty()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;Z)V
    .locals 4

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->g(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->e(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, ", mJustNotifyEndCallback: "

    .line 19
    .line 20
    const-string v2, ", animType: "

    .line 21
    .line 22
    const-string v3, "Animation end, canceled: "

    .line 23
    .line 24
    invoke-static {v3, p2, v1, p1, v2}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, "CustomRectFSpringAnim"

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {v0, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 41
    .line 42
    invoke-static {p1, p2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->i(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->g(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->maybeEnd()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->d(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 68
    .line 69
    const/4 p2, 0x0

    .line 70
    invoke-static {p1, p2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->h(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->f(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimActualEnd(Landroid/animation/Animator;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method
