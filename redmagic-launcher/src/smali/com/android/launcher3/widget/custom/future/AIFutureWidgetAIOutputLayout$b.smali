.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;
.super Ljava/lang/Object;
.source "AIFutureWidgetAIOutputLayout.java"

# interfaces
.implements Landroid/view/View$OnScrollChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollChange(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->c(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    if-eq p3, p5, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
