.class Lcom/android/launcher3/allapps/i0$j;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PrivateProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/i0;->T(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$j;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/i0$j;->g:Z

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
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/i0$j;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$j;->h:Lcom/android/launcher3/allapps/i0;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$j;->h:Lcom/android/launcher3/allapps/i0;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$j;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$j;->h:Lcom/android/launcher3/allapps/i0;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
