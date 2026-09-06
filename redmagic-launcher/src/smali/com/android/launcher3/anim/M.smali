.class public Lcom/android/launcher3/anim/M;
.super Landroid/view/WindowInsetsAnimation$Callback;
.source "KeyboardInsetAnimationCallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/anim/M$b;,
        Lcom/android/launcher3/anim/M$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/view/View;

.field private b:F

.field private c:F

.field private d:Lcom/android/launcher3/anim/M$b;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Landroid/view/WindowInsetsAnimation$Callback;-><init>(I)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/anim/M$b;->g:Lcom/android/launcher3/anim/M$b;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/anim/M;->d:Lcom/android/launcher3/anim/M$b;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onEnd(Landroid/view/WindowInsetsAnimation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/android/launcher3/anim/M$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/anim/M$a;

    .line 8
    .line 9
    invoke-interface {p1}, Lcom/android/launcher3/anim/M$a;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object p1, Lcom/android/launcher3/anim/M$b;->g:Lcom/android/launcher3/anim/M$b;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/anim/M;->d:Lcom/android/launcher3/anim/M$b;

    .line 15
    .line 16
    return-void
.end method

.method public onPrepare(Landroid/view/WindowInsetsAnimation;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/launcher3/anim/M$b;->h:Lcom/android/launcher3/anim/M$b;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/anim/M;->d:Lcom/android/launcher3/anim/M$b;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/android/launcher3/anim/M;->b:F

    .line 12
    .line 13
    return-void
.end method

.method public onProgress(Landroid/view/WindowInsets;Ljava/util/List;)Landroid/view/WindowInsets;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/WindowInsets;",
            "Ljava/util/List<",
            "Landroid/view/WindowInsetsAnimation;",
            ">;)",
            "Landroid/view/WindowInsets;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/anim/M;->b:F

    .line 10
    .line 11
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 12
    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Landroid/view/WindowInsetsAnimation;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/WindowInsetsAnimation;->getDurationMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    const-wide/16 v2, -0x1

    .line 27
    .line 28
    cmp-long v0, v0, v2

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/WindowInsetsAnimation;->getInterpolatedFraction()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 37
    .line 38
    iget v2, p0, Lcom/android/launcher3/anim/M;->b:F

    .line 39
    .line 40
    iget v3, p0, Lcom/android/launcher3/anim/M;->c:F

    .line 41
    .line 42
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget v0, v0, Landroid/graphics/Insets;->bottom:I

    .line 59
    .line 60
    neg-int v0, v0

    .line 61
    iget-object v1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    instance-of v1, v1, Landroid/view/View;

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    int-to-float v0, v0

    .line 72
    iget-object v1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 73
    .line 74
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Landroid/view/View;

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    sub-float/2addr v0, v1

    .line 85
    float-to-int v0, v0

    .line 86
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 87
    .line 88
    int-to-float v0, v0

    .line 89
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 93
    .line 94
    instance-of v0, p0, Lcom/android/launcher3/anim/M$a;

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    check-cast p0, Lcom/android/launcher3/anim/M$a;

    .line 99
    .line 100
    invoke-virtual {p2}, Landroid/view/WindowInsetsAnimation;->getAlpha()F

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    invoke-interface {p0, p2}, Lcom/android/launcher3/anim/M$a;->b(F)V

    .line 105
    .line 106
    .line 107
    :cond_3
    return-object p1
.end method

.method public onStart(Landroid/view/WindowInsetsAnimation;Landroid/view/WindowInsetsAnimation$Bounds;)Landroid/view/WindowInsetsAnimation$Bounds;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/launcher3/anim/M;->c:F

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/anim/M;->b:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/android/launcher3/anim/M$b;->i:Lcom/android/launcher3/anim/M$b;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/anim/M;->d:Lcom/android/launcher3/anim/M$b;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/anim/M;->a:Landroid/view/View;

    .line 21
    .line 22
    instance-of v1, v0, Lcom/android/launcher3/anim/M$a;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/anim/M$a;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/android/launcher3/anim/M$a;->c()V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/WindowInsetsAnimation$Callback;->onStart(Landroid/view/WindowInsetsAnimation;Landroid/view/WindowInsetsAnimation$Bounds;)Landroid/view/WindowInsetsAnimation$Bounds;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
