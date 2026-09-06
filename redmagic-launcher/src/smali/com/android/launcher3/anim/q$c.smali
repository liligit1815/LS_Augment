.class Lcom/android/launcher3/anim/q$c;
.super Lcom/android/launcher3/anim/g;
.source "AnimatorPlaybackController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/anim/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field g:Z

.field final synthetic h:Lcom/android/launcher3/anim/q;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/anim/q$c;->h:Lcom/android/launcher3/anim/q;

    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q$c;->g:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/anim/q;Lcom/android/launcher3/anim/s;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/anim/q$c;-><init>(Lcom/android/launcher3/anim/q;)V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/anim/g;->mCancelled:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q$c;->g:Z

    .line 5
    .line 6
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/anim/q$c;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/anim/q$c;->h:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->j()Lcom/android/launcher3/anim/q;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/anim/q$c;->h:Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/anim/q;->d(Lcom/android/launcher3/anim/q;)Ljava/lang/Runnable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/anim/q$c;->h:Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/anim/q;->d(Lcom/android/launcher3/anim/q;)Ljava/lang/Runnable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q$c;->g:Z

    .line 29
    .line 30
    :cond_1
    return-void
.end method
