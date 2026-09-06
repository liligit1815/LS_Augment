.class Lcom/android/launcher3/allapps/WorkUtilityView$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "WorkUtilityView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/WorkUtilityView;->u(Z)V
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
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->g:Z

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
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->g:Z

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->o(Lcom/android/launcher3/allapps/WorkUtilityView;I)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 23
    .line 24
    invoke-static {p1, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->p(Lcom/android/launcher3/allapps/WorkUtilityView;I)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

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
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$e;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
