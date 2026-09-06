.class Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PageIndicatorDots.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/pageindicators/PageIndicatorDots;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->g:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Lcom/android/launcher3/pageindicators/f;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->k(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->q(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p1, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Landroid/animation/ObjectAnimator;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;->h:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->o(Lcom/android/launcher3/pageindicators/PageIndicatorDots;F)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
