.class public Lcom/android/launcher3/popup/P$b;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/popup/P$b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/P<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/popup/P$b$a;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v3, "shortcut_common_bg"

    const v4, 0x7f140092

    const v1, 0x7f080d35

    const-string v2, "info_outline"

    move-object v0, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/P;-><init>(ILjava/lang/String;Ljava/lang/String;ILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/popup/P$b$a;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Lcom/android/launcher3/popup/P$b$a;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 2
    const-string v3, "shortcut_common_bg"

    const v4, 0x7f140092

    const v1, 0x7f080d35

    move-object v0, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v2, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/P;-><init>(ILjava/lang/String;Ljava/lang/String;ILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 3
    iput-object p4, v0, Lcom/android/launcher3/popup/P$b;->g:Lcom/android/launcher3/popup/P$b$a;

    .line 4
    iget p0, p4, Lcom/android/launcher3/popup/P$b$a;->c:I

    iput p0, v0, Lcom/android/launcher3/popup/P;->mAccessibilityActionId:I

    return-void
.end method


# virtual methods
.method public createAccessibilityAction(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P$b;->g:Lcom/android/launcher3/popup/P$b$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/android/launcher3/popup/P$b$a;->a:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/popup/P$b$a;->b:Ljava/lang/CharSequence;

    .line 10
    .line 11
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v1, 0x7f140406

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 23
    .line 24
    iget p0, p0, Lcom/android/launcher3/popup/P;->mAccessibilityActionId:I

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/popup/P;->createAccessibilityAction(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/N5;->u(Landroid/view/View;)Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    invoke-interface {v1, p1, v2}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, v1, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 14
    .line 15
    new-instance v3, Lcom/android/launcher3/popup/Q;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Lcom/android/launcher3/popup/Q;-><init>(Lcom/android/launcher3/popup/P$b;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {p1, v2, v0, v1}, Lcom/android/launcher3/util/J1;->p(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->M:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 53
    .line 54
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 58
    .line 59
    instance-of v0, p1, Lcom/android/launcher3/statemanager/i;

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    check-cast p1, Lcom/android/launcher3/statemanager/i;

    .line 64
    .line 65
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 66
    .line 67
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 84
    .line 85
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const v0, 0x7f140132

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p1, p0}, Lh1/a;->H(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    return-void
.end method
