.class public interface abstract Lcom/android/systemui/unfold/progress/b;
.super Ljava/lang/Object;
.source "IUnfoldTransitionListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/progress/b$a;
    }
.end annotation


# virtual methods
.method public abstract onTransitionFinished()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onTransitionProgress(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onTransitionStarted()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
