.class Lcom/android/launcher3/M2$a$b;
.super Lcom/android/launcher3/anim/U;
.source "LauncherAnimationRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/M2$a;->v2(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/M2$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/M2$a$b;->g:Lcom/android/launcher3/M2$a;

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
    const-string p1, "LauncherAnimationRunner"

    .line 2
    .line 3
    const-string v0, "Window anim ended, try to finish"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/M2$a$b;->g:Lcom/android/launcher3/M2$a;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/M2$a;->p2(Lcom/android/launcher3/M2$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
