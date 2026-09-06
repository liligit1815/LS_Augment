.class Lcom/android/launcher3/popup/c$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ArrowPopup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/c;->animateClose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/popup/c;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/c$b;->g:Lcom/android/launcher3/popup/c;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c$b;->g:Lcom/android/launcher3/popup/c;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/android/launcher3/popup/c;->mDeferContainerRemoval:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x4

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->closeComplete()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
