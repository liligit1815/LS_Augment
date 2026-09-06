.class Lcom/android/launcher3/allapps/WorkUtilityView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "WorkUtilityView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/WorkUtilityView;->s(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/allapps/WorkUtilityView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/WorkUtilityView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->i(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageButton;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 p1, 0x8

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$b;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->i(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageButton;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
