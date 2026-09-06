.class public Lcom/android/launcher3/widget/s0;
.super Lcom/android/launcher3/widget/T;
.source "ListenableHostView.java"


# instance fields
.field private W:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/widget/s0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/s0;->c0(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b0(Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 2
    .line 3
    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/widget/r0;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/widget/r0;-><init>(Lcom/android/launcher3/widget/s0;Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/T;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/android/launcher3/widget/T;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/s0;->W:Ljava/util/Set;

    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/widget/q0;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/android/launcher3/widget/q0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
