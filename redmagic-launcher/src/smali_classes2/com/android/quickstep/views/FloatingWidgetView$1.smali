.class Lcom/android/quickstep/views/FloatingWidgetView$1;
.super Landroid/view/ViewOutlineProvider;
.source "FloatingWidgetView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/FloatingWidgetView;->init(Lcom/android/launcher3/dragndrop/DragLayer;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/FloatingWidgetView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$1;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$1;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/FloatingWidgetView;->c(Lcom/android/quickstep/views/FloatingWidgetView;)Landroid/graphics/RectF;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView$1;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/quickstep/views/FloatingWidgetView;->d(Lcom/android/quickstep/views/FloatingWidgetView;)Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$1;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/quickstep/views/FloatingWidgetView;->d(Lcom/android/quickstep/views/FloatingWidgetView;)Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView$1;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->e(Lcom/android/quickstep/views/FloatingWidgetView;)Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->getOutlineRadius()F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
