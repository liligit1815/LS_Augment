.class Lcom/android/launcher3/popup/c$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ArrowPopup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/c;->animateOpen()V
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
    iput-object p1, p0, Lcom/android/launcher3/popup/c$a;->g:Lcom/android/launcher3/popup/c;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/c$a;->g:Lcom/android/launcher3/popup/c;

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/popup/c$a;->g:Lcom/android/launcher3/popup/c;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/popup/c;->access$000(Lcom/android/launcher3/popup/c;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/popup/c$a;->g:Lcom/android/launcher3/popup/c;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    return-void
.end method
