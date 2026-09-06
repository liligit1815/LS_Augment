.class public Lcom/android/launcher3/widget/T0;
.super Ljava/lang/Object;
.source "WidgetHostViewLoader.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;


# instance fields
.field g:Ljava/lang/Runnable;

.field private h:Ljava/lang/Runnable;

.field i:Lcom/android/launcher3/C2;

.field j:Landroid/os/Handler;

.field final k:Landroid/view/View;

.field final l:Lcom/android/launcher3/widget/z0;

.field m:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/widget/T0;->g:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/widget/T0;->h:Ljava/lang/Runnable;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/android/launcher3/widget/T0;->m:I

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    new-instance p1, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/widget/T0;->j:Landroid/os/Handler;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/launcher3/widget/T0;->k:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/android/launcher3/widget/z0;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T0;->a()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->B()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/android/launcher3/widget/z0;->P(Landroid/content/Context;)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v3, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/android/launcher3/widget/z0;->Q()Lcom/android/launcher3/widget/N0;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Lcom/android/launcher3/widget/N0;->b()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 34
    .line 35
    iput-object v1, p0, Lcom/android/launcher3/widget/z0;->p:Landroid/os/Bundle;

    .line 36
    .line 37
    return v2

    .line 38
    :cond_1
    new-instance v2, Lcom/android/launcher3/widget/T0$a;

    .line 39
    .line 40
    invoke-direct {v2, p0, v0, v1}, Lcom/android/launcher3/widget/T0$a;-><init>(Lcom/android/launcher3/widget/T0;Lcom/android/launcher3/widget/U;Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/android/launcher3/widget/T0;->h:Ljava/lang/Runnable;

    .line 44
    .line 45
    new-instance v1, Lcom/android/launcher3/widget/T0$b;

    .line 46
    .line 47
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/widget/T0$b;-><init>(Lcom/android/launcher3/widget/T0;Lcom/android/launcher3/widget/U;)V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lcom/android/launcher3/widget/T0;->g:Ljava/lang/Runnable;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->j:Landroid/os/Handler;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/widget/T0;->h:Ljava/lang/Runnable;

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0
.end method

.method public v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->j:Landroid/os/Handler;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/T0;->h:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->j:Landroid/os/Handler;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/widget/T0;->g:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Lcom/android/launcher3/widget/T0;->m:I

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v2, p0, Lcom/android/launcher3/widget/T0;->m:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 38
    .line 39
    .line 40
    iput v1, p0, Lcom/android/launcher3/widget/T0;->m:I

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v1, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/widget/T0;->l:Lcom/android/launcher3/widget/z0;

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 82
    .line 83
    :cond_1
    return-void
.end method
