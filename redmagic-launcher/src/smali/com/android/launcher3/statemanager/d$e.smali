.class Lcom/android/launcher3/statemanager/d$e;
.super Ljava/lang/Object;
.source "StateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/statemanager/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field private final g:Landroid/animation/AnimatorSet;

.field final synthetic h:Lcom/android/launcher3/statemanager/d;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/statemanager/d;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$e;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/statemanager/d$e;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d;->e(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/d$c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    const-string v1, "StateManager"

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->h:Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d;->f(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 23
    .line 24
    if-eq v0, v2, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->h:Lcom/android/launcher3/statemanager/d;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d;->f(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 33
    .line 34
    if-ne v0, v2, :cond_1

    .line 35
    .line 36
    :cond_0
    const-string p0, "run: mConfig.currentAnimation == null  ---return---"

    .line 37
    .line 38
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->h:Lcom/android/launcher3/statemanager/d;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d;->e(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/d$c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    if-eq v0, v2, :cond_2

    .line 58
    .line 59
    const-string v0, "run: anim is different. cancel animation."

    .line 60
    .line 61
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    const-wide/16 v1, 0x0

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$e;->g:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method
