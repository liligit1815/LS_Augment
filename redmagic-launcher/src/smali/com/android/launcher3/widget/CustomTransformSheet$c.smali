.class Lcom/android/launcher3/widget/CustomTransformSheet$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CustomTransformSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/CustomTransformSheet;->Y(ZJ)V
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
    iput-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$c;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

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
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$c;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/o;->d0()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet$c;->g:Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/widget/CustomTransformSheet;->b1(Lcom/android/launcher3/widget/CustomTransformSheet;)Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
