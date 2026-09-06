.class Lcom/android/launcher3/anim/P$h;
.super Lcom/android/launcher3/anim/U;
.source "MFVLauncherAppTransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/P;->s(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/Rect;ZILcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/anim/P;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/P;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/P$h;->g:Lcom/android/launcher3/anim/P;

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
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "App open animator set end. #"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "MFVLauncherAppTransitionHelper"

    .line 23
    .line 24
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/anim/P$h;->g:Lcom/android/launcher3/anim/P;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->releaseIconLayerIfNeeded(I)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/anim/P$h;->g:Lcom/android/launcher3/anim/P;

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/N;->j(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
