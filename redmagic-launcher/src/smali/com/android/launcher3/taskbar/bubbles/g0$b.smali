.class Lcom/android/launcher3/taskbar/bubbles/g0$b;
.super Ljava/lang/Object;
.source "BubbleBarViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/g0;->w0(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/bubbles/g0$h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(LN2/h;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->t(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/t;->d3(LN2/h;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v(Lcom/android/launcher3/taskbar/bubbles/g0;)LX1/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, LX1/b;->b()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v1(ZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->s(Lcom/android/launcher3/taskbar/bubbles/g0;)Landroid/widget/FrameLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->w(Lcom/android/launcher3/taskbar/bubbles/g0;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    int-to-float p0, p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$b;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->e1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
