.class Lcom/android/launcher3/widget/F0$a;
.super Ljava/lang/Object;
.source "PendingAppWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/android/launcher3/widget/p0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/F0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lcom/android/launcher3/widget/F0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/F0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/widget/F0$a;->g:Z

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/widget/F0;->d0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/widget/l0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/l0;->q(Lcom/android/launcher3/widget/p0$b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getHandler()Landroid/os/Handler;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-class v0, Lcom/android/launcher3/widget/F0$a;

    .line 25
    .line 26
    iput-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/android/launcher3/widget/F0;->b0(Lcom/android/launcher3/widget/F0;)Landroid/os/Handler;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-wide/16 v0, 0x2710

    .line 33
    .line 34
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/F0;->d0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/widget/l0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/l0;->N(Lcom/android/launcher3/widget/p0$b;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/widget/F0;->b0(Lcom/android/launcher3/widget/F0;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/Y0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/android/launcher3/widget/F0;->c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/android/launcher3/widget/F0;->c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/android/launcher3/widget/F0;->c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/android/launcher3/widget/F0;->c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget v1, v1, Lcom/android/launcher3/model/data/A;->g:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/android/launcher3/widget/F0;->c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/A;->getTargetComponent()Landroid/content/ComponentName;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/widget/Y0;->g(ILandroid/content/ComponentName;)Lcom/android/launcher3/widget/U;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    :goto_0
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0$a;->run()V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0$a;->a()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/F0$a;->g:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/F0$a;->h:Lcom/android/launcher3/widget/F0;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/widget/F0;->T()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/widget/F0$a;->g:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method
