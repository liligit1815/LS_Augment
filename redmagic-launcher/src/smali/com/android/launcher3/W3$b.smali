.class Lcom/android/launcher3/W3$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MFVAnimationSets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/W3;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/W3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/W3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/W3$b;->g:Lcom/android/launcher3/W3;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/W3$b;->g:Lcom/android/launcher3/W3;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    :goto_0
    if-ltz p1, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/W3$b;->g:Lcom/android/launcher3/W3;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/W3$b;->g:Lcom/android/launcher3/W3;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 26
    .line 27
    if-eq v0, v1, :cond_2

    .line 28
    .line 29
    invoke-static {v0}, Lx1/v;->q(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/widget/T;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    move-object v1, v0

    .line 41
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 49
    .line 50
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/W3$b;->g:Lcom/android/launcher3/W3;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    iput-object v1, v0, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 60
    .line 61
    :goto_2
    add-int/lit8 p1, p1, -0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    return-void
.end method
