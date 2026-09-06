.class Lcom/android/launcher3/anim/C$c;
.super Lcom/android/launcher3/anim/g;
.source "AppOCAnimHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/C;->v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/Workspace;

.field final synthetic h:Lcom/android/launcher3/Hotseat;

.field final synthetic i:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field final synthetic j:Lcom/android/launcher3/LongClickTextView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/C$c;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/C$c;->h:Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/C$c;->i:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/anim/C$c;->j:Lcom/android/launcher3/LongClickTextView;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/C$c;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->resetPivot()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/anim/C$c;->h:Lcom/android/launcher3/Hotseat;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/ViewGroup;->resetPivot()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/anim/C$c;->i:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->resetPivot()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/C$c;->j:Lcom/android/launcher3/LongClickTextView;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/TextView;->resetPivot()V

    .line 23
    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->e(Landroid/animation/ValueAnimator;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
