.class Lcom/android/launcher3/widget/ComponentsFullSheet$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ComponentsFullSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/ComponentsFullSheet;->j1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/o;

.field final synthetic h:Lcom/android/launcher3/widget/ComponentsFullSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/ComponentsFullSheet;Lcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->h:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->g:Lcom/android/launcher3/widget/o;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->h:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutFrozen(Z)V

    .line 10
    .line 11
    .line 12
    const-string p1, "ComponentsFullSheet"

    .line 13
    .line 14
    const-string p2, "onAnimationEnd: "

    .line 15
    .line 16
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->g:Lcom/android/launcher3/widget/o;

    .line 20
    .line 21
    instance-of p2, p1, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    instance-of p2, p1, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 26
    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->g:Lcom/android/launcher3/widget/o;

    .line 36
    .line 37
    const p2, 0x3f19999a    # 0.6f

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet$c;->h:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentsFullSheet;->d1(Lcom/android/launcher3/widget/ComponentsFullSheet;)Lcom/android/launcher3/anim/q;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "ComponentsFullSheet"

    .line 5
    .line 6
    const-string p1, "onAnimationStart: "

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method
