.class Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;
.super Ljava/lang/Object;
.source "BubbleBarView.java"

# interfaces
.implements LV1/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field final synthetic b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LV1/b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)LN2/h;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
