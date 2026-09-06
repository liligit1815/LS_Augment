.class Lcom/android/launcher3/widget/WidgetCell$a;
.super Landroid/view/View$AccessibilityDelegate;
.source "WidgetCell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/WidgetCell;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/WidgetCell;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/WidgetCell;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell$a;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell$a;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->hasOnClickListeners()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell$a;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell$a;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/widget/WidgetCell;->d(Lcom/android/launcher3/widget/WidgetCell;)Landroid/widget/Button;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell$a;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/launcher3/widget/WidgetCell;->d(Lcom/android/launcher3/widget/WidgetCell;)Landroid/widget/Button;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/widget/Button;->isShown()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const p0, 0x7f14047e

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const p0, 0x7f14047f

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance p1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 50
    .line 51
    const/16 v0, 0x10

    .line 52
    .line 53
    invoke-direct {p1, v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method
