.class public final Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;
.super Lcom/android/launcher3/taskbar/E4;
.source "TaskbarViewCallbacksFactory.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;->a(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/TaskbarView;)Lcom/android/launcher3/taskbar/E4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic e:Lcom/android/launcher3/taskbar/I1;

.field final synthetic f:Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/TaskbarView;Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->e:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->f:Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/E4;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/TaskbarView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/taskbar/E4;->H()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->e:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    const/16 v1, 0xa

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->show(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->e:Lcom/android/launcher3/taskbar/I1;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->e:Lcom/android/launcher3/taskbar/I1;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/view/Display;->getDisplayId()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-virtual {v0, v2, v1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->e:Lcom/android/launcher3/taskbar/I1;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withPackageName(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->K3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 63
    .line 64
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public w(Landroid/content/Context;)Z
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory$b;->f:Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;->b(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
