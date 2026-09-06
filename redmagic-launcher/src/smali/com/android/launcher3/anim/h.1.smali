.class public Lcom/android/launcher3/anim/h;
.super Ljava/lang/Object;
.source "AnimatorListeners.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/anim/h$c;,
        Lcom/android/launcher3/anim/h$b;
    }
.end annotation


# direct methods
.method public static a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/h$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/anim/h$a;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Ljava/util/function/Consumer;)Landroid/animation/Animator$AnimatorListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Landroid/animation/Animator$AnimatorListener;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/h$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/anim/h$b;-><init>(Ljava/util/function/Consumer;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/h$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/anim/h$c;-><init>(Ljava/lang/Runnable;Lcom/android/launcher3/anim/i;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
