.class Lcom/android/launcher3/widget/ComponentDetailSheet$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ComponentDetailSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/ComponentDetailSheet;->f1(ZJ)V
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
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$d;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

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
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$d;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/o;->d0()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet$d;->g:Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->e1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/anim/q;

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
