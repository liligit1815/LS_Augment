.class final Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;
.super Ljava/lang/Object;
.source "LsNativeStack.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/LsNativeStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EntryRevealUpdate"
.end annotation


# instance fields
.field private final recents:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 446
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 447
    iput-object p1, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;->recents:Lcom/android/quickstep/views/RecentsView;

    .line 448
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 452
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$1300()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;->recents:Lcom/android/quickstep/views/RecentsView;

    if-eq v0, v1, :cond_0

    .line 453
    return-void

    .line 455
    :cond_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->access$1402(F)F

    .line 456
    iget-object p1, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;->recents:Lcom/android/quickstep/views/RecentsView;

    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 457
    return-void
.end method
