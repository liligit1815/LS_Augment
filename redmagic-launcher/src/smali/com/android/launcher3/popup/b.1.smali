.class public final synthetic Lcom/android/launcher3/popup/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/popup/c;

.field public final synthetic h:Landroid/animation/Animator;

.field public final synthetic i:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/popup/c;Landroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/b;->g:Lcom/android/launcher3/popup/c;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/popup/b;->h:Landroid/animation/Animator;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/popup/b;->i:Landroid/animation/Animator;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/b;->g:Lcom/android/launcher3/popup/c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/popup/b;->h:Landroid/animation/Animator;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/popup/b;->i:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/popup/c;->O(Lcom/android/launcher3/popup/c;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
