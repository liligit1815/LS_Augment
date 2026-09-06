.class Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;
.super Ljava/lang/Object;
.source "BubbleBarView.java"

# interfaces
.implements LV1/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h0(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Z

.field final synthetic c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/view/View;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LV1/b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c(F)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sub-float/2addr v1, p1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->a:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)LN2/h;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
