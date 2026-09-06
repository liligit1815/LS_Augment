.class Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;
.super Ljava/lang/Object;
.source "BubbleBarView.java"

# interfaces
.implements LV1/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field final synthetic b:Ljava/lang/Runnable;

.field final synthetic c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field final synthetic d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->b:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LV1/b;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->b:Ljava/lang/Runnable;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public c(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    sub-float/2addr v1, p1

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)LN2/h;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
