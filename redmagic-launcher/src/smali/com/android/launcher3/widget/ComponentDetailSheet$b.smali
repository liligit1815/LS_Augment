.class Lcom/android/launcher3/widget/ComponentDetailSheet$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ComponentDetailSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/ComponentDetailSheet;->k1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/ComponentDetailSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
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
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

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
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->a1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/widget/o;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    instance-of p1, p1, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->a1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/widget/o;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    instance-of p1, p1, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->a1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/widget/o;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->a1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/widget/o;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const p2, 0x3f19999a    # 0.6f

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->c1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/anim/q;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
