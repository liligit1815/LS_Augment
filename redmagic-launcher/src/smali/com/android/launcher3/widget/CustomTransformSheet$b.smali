.class Lcom/android/launcher3/widget/CustomTransformSheet$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CustomTransformSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/CustomTransformSheet;->i1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/CustomTransformSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/CustomTransformSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

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
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

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
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->Z0(Lcom/android/launcher3/widget/CustomTransformSheet;)Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->Z0(Lcom/android/launcher3/widget/CustomTransformSheet;)Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->Z0(Lcom/android/launcher3/widget/CustomTransformSheet;)Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const p2, 0x3f19999a    # 0.6f

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$b;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->a1(Lcom/android/launcher3/widget/CustomTransformSheet;)Lcom/android/launcher3/anim/q;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
