.class Lcom/android/launcher3/taskbar/a4$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarStashController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/a4;->K(ZJIZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:J

.field final synthetic i:Lcom/android/launcher3/taskbar/a4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/a4;ZJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/a4$a;->g:Z

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/android/launcher3/taskbar/a4$a;->h:J

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
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/a4;->s(Lcom/android/launcher3/taskbar/a4;Landroid/animation/AnimatorSet;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/taskbar/a4;->q(Lcom/android/launcher3/taskbar/a4;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/android/launcher3/taskbar/a4;->A(Lcom/android/launcher3/taskbar/a4;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/a4$a;->h:J

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-lez p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/android/launcher3/taskbar/a4;->p(Lcom/android/launcher3/taskbar/a4;)Lcom/android/launcher3/taskbar/R1;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->z()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4$a;->g:Z

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/a4;->t(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/taskbar/a4;->q(Lcom/android/launcher3/taskbar/a4;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/a4;->y(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$a;->i:Lcom/android/launcher3/taskbar/a4;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->I()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
