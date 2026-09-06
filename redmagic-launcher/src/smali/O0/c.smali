.class public abstract LO0/c;
.super Landroid/view/View$AccessibilityDelegate;
.source "BaseAccessibilityDelegate.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO0/c$a;,
        LO0/c$c;,
        LO0/c$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Landroid/view/View$AccessibilityDelegate;",
        "Lcom/android/launcher3/dragndrop/j$b;"
    }
.end annotation


# instance fields
.field protected final g:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "LO0/c<",
            "TT;>.c;>;"
        }
    .end annotation
.end field

.field protected final h:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected i:LO0/c$a;


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, LO0/c;->i:LO0/c$a;

    .line 13
    .line 14
    iput-object p1, p0, LO0/c;->h:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Landroid/view/accessibility/AccessibilityNodeInfo;LO0/c$c;)V
    .locals 0

    .line 1
    iget-object p1, p1, LO0/c$c;->b:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private h(Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->H()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/android/launcher3/views/s;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    check-cast p1, Lcom/android/launcher3/views/s;

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/android/launcher3/views/s;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Lcom/android/launcher3/views/s;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->H()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v0
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c()LO0/c$a;
    .locals 0

    .line 1
    iget-object p0, p0, LO0/c;->i:LO0/c$a;

    .line 2
    .line 3
    return-object p0
.end method

.method protected abstract d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "LO0/c<",
            "TT;>.c;>;)V"
        }
    .end annotation
.end method

.method public e(Landroid/view/View;Landroid/graphics/Rect;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, LO0/c;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    new-array v1, v0, [I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    div-int/2addr p2, v0

    .line 20
    aput p2, v1, v3

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    div-int/2addr p2, v0

    .line 27
    aput p2, v1, v2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    aput v0, v1, v3

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    aput p2, v1, v2

    .line 41
    .line 42
    :goto_0
    iget-object p2, p0, LO0/c;->h:Landroid/content/Context;

    .line 43
    .line 44
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2, p1, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, LO0/c;->h:Landroid/content/Context;

    .line 54
    .line 55
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v1}, Lcom/android/launcher3/dragndrop/j;->n([I)V

    .line 62
    .line 63
    .line 64
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0, p3}, LO0/c;->b(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, LO0/c;->i:LO0/c$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected g(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget p0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 12
    .line 13
    const/16 p1, -0x67

    .line 14
    .line 15
    if-eq p0, p1, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    return v0

    .line 19
    :cond_1
    instance-of p0, p1, Lcom/android/launcher3/model/data/A;

    .line 20
    .line 21
    if-nez p0, :cond_3

    .line 22
    .line 23
    instance-of p0, p1, Lcom/android/launcher3/model/data/m;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    return v0

    .line 29
    :cond_3
    :goto_0
    return v1
.end method

.method protected abstract i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, v0, v1}, LO0/c;->d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, LO0/b;

    .line 27
    .line 28
    invoke-direct {v0, p2}, LO0/b;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1}, LO0/c;->h(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_LONG_CLICK:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v0, p2, v1}, LO0/c;->i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, LO0/c;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, LO0/c;->i:LO0/c$a;

    .line 14
    .line 15
    return-void
.end method
