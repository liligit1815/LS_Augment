.class Lcom/android/launcher3/CellLayout$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Z

.field final synthetic h:Lc1/b;

.field final synthetic i:Lcom/android/launcher3/G5;

.field final synthetic j:Landroid/view/View;

.field final synthetic k:Ljava/lang/Runnable;

.field final synthetic l:Lcom/android/launcher3/CellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/CellLayout;Lc1/b;Lcom/android/launcher3/G5;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout$f;->l:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/CellLayout$f;->h:Lc1/b;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/CellLayout$f;->i:Lcom/android/launcher3/G5;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/CellLayout$f;->j:Landroid/view/View;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/CellLayout$f;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout$f;->g:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout$f;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/CellLayout$f;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/CellLayout$f;->h:Lc1/b;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p1, Lc1/b;->h:Z

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/CellLayout$f;->i:Lcom/android/launcher3/G5;

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, v0, v1, v1}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/CellLayout$f;->j:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/CellLayout$f;->l:Lcom/android/launcher3/CellLayout;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$f;->h:Lc1/b;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/CellLayout$f;->l:Lcom/android/launcher3/CellLayout;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$f;->h:Lc1/b;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-static {}, Lx1/O;->C3()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/CellLayout$f;->k:Ljava/lang/Runnable;

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method
