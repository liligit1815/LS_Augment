.class Lcom/android/launcher3/widget/suggest/m$g;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SuggestWidgetHostView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m;->o0(ZLcom/android/launcher3/widget/suggest/e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/widget/suggest/e;

.field final synthetic i:F


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;Ljava/util/ArrayList;Lcom/android/launcher3/widget/suggest/e;F)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/m$g;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/widget/suggest/m$g;->h:Lcom/android/launcher3/widget/suggest/e;

    .line 4
    .line 5
    iput p4, p0, Lcom/android/launcher3/widget/suggest/m$g;->i:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/m$g;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/widget/suggest/e;

    .line 21
    .line 22
    instance-of v1, v0, Landroid/view/View;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$g;->h:Lcom/android/launcher3/widget/suggest/e;

    .line 27
    .line 28
    if-eq v0, v1, :cond_0

    .line 29
    .line 30
    check-cast v0, Landroid/view/View;

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/widget/suggest/m$g;->i:F

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method
