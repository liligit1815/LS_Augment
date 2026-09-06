.class Lcom/android/launcher3/taskbar/bubbles/g0$a;
.super Ljava/lang/Object;
.source "BubbleBarViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/w$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/bubbles/g0;
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
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->f1(LN2/h;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/quickstep/SystemUiProxy;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/SystemUiProxy;->showBubbleDropTarget(ZLN2/h;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->i1()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/quickstep/SystemUiProxy;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->showBubbleDropTarget(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(LN2/h;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->q(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 20
    .line 21
    iget v1, v0, Landroid/graphics/Point;->y:I

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->u(Lcom/android/launcher3/taskbar/bubbles/g0;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    sub-int/2addr v1, v2

    .line 30
    iput v1, p2, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    iget v1, v0, Landroid/graphics/Point;->y:I

    .line 33
    .line 34
    iput v1, p2, Landroid/graphics/Rect;->bottom:I

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1, v1}, LN2/h;->e(Z)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput p1, p2, Landroid/graphics/Rect;->left:I

    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->u(Lcom/android/launcher3/taskbar/bubbles/g0;)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget p1, v0, Landroid/graphics/Point;->x:I

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 67
    .line 68
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->u(Lcom/android/launcher3/taskbar/bubbles/g0;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    sub-int/2addr p1, p0

    .line 73
    iput p1, p2, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    iget p0, v0, Landroid/graphics/Point;->x:I

    .line 76
    .line 77
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 78
    .line 79
    return-void
.end method

.method public d(LN2/h;Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->q(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 8
    .line 9
    .line 10
    instance-of v0, p2, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move-object v0, p2

    .line 15
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->R()Landroid/content/pm/ShortcutInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/quickstep/SystemUiProxy;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/SystemUiProxy;->showShortcutBubble(Landroid/content/pm/ShortcutInfo;LN2/h;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/quickstep/SystemUiProxy;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 63
    .line 64
    invoke-virtual {p0, v0, p2, p1}, Lcom/android/quickstep/SystemUiProxy;->showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public getDropView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$a;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
