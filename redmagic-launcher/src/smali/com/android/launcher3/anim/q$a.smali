.class Lcom/android/launcher3/anim/q$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AnimatorPlaybackController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/q;-><init>(Landroid/animation/AnimatorSet;JLjava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/anim/q;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/q$a;->g:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q$a;->g:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q;->m:Z

    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q$a;->g:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q;->m:Z

    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q$a;->g:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/anim/q;->m:Z

    .line 5
    .line 6
    return-void
.end method
