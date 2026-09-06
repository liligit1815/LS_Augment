.class final Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LsNativeStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/LsNativeStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EntryRevealEnd"
.end annotation


# instance fields
.field private final recents:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 463
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 464
    iput-object p1, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;->recents:Lcom/android/quickstep/views/RecentsView;

    .line 465
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 469
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$1300()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;->recents:Lcom/android/quickstep/views/RecentsView;

    if-ne v0, v1, :cond_0

    .line 470
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->access$1402(F)F

    .line 471
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$1300()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 472
    iget-object v0, p0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;->recents:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 474
    :cond_0
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$1500()Landroid/animation/ValueAnimator;

    move-result-object v0

    if-ne v0, p1, :cond_1

    .line 475
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->access$1502(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 477
    :cond_1
    return-void
.end method
