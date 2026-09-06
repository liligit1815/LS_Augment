.class public Lcom/android/launcher3/anim/U;
.super Landroid/animation/AnimatorListenerAdapter;
.source "NullableAnimatorListenerAdapter.java"

# interfaces
.implements Lcom/android/launcher3/anim/T;


# instance fields
.field private mAnimationId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/anim/U;->mAnimationId:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getAnimationId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/U;->mAnimationId:I

    .line 2
    .line 3
    return p0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public setAnimationId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/U;->mAnimationId:I

    .line 2
    .line 3
    return-void
.end method
