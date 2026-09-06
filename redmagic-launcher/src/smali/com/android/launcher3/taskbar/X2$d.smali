.class Lcom/android/launcher3/taskbar/X2$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarLauncherStateController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/X2;->a0(IJZ)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/taskbar/a4;

.field final synthetic i:J

.field final synthetic j:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;ZLcom/android/launcher3/taskbar/a4;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$d;->j:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/X2$d;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/X2$d;->h:Lcom/android/launcher3/taskbar/a4;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/android/launcher3/taskbar/X2$d;->i:J

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$d;->j:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/X2;->s(Lcom/android/launcher3/taskbar/X2;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$d;->j:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2$d;->g:Z

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/X2;->s(Lcom/android/launcher3/taskbar/X2;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$d;->h:Lcom/android/launcher3/taskbar/a4;

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2$d;->g:Z

    .line 11
    .line 12
    xor-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    const-wide/16 v1, 0x1

    .line 15
    .line 16
    invoke-virtual {p1, v1, v2, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$d;->h:Lcom/android/launcher3/taskbar/a4;

    .line 20
    .line 21
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/X2$d;->i:J

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
