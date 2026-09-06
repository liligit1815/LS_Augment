.class Lcom/android/launcher3/taskbar/s$a;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/s;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method c(I)Lcom/android/quickstep/util/GroupTask;
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->p(Lcom/android/launcher3/taskbar/s;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s;->p(Lcom/android/launcher3/taskbar/s;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/android/quickstep/util/GroupTask;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->l(Lcom/android/launcher3/taskbar/s;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s;->l(Lcom/android/launcher3/taskbar/s;)Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p0, p0, Lcom/android/launcher3/h0;->Y0:F

    .line 22
    .line 23
    invoke-static {p0}, Lcom/android/quickstep/util/LayoutUtils;->isAspectRatioSquare(F)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method e()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s$a;->c(I)Lcom/android/quickstep/util/GroupTask;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s$a;->f(Lcom/android/quickstep/util/GroupTask;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method f(Lcom/android/quickstep/util/GroupTask;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTask()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    iget p0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/GroupTask;->containsTask(I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method g()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->o(Lcom/android/launcher3/taskbar/s;)La2/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->o(Lcom/android/launcher3/taskbar/s;)La2/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, La2/h;->d(Lcom/android/launcher3/util/G2;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/s;->r(Lcom/android/launcher3/taskbar/s;La2/a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 37
    .line 38
    invoke-static {p0, v1}, Lcom/android/launcher3/taskbar/s;->s(Lcom/android/launcher3/taskbar/s;Lcom/android/launcher3/taskbar/L;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->n(Lcom/android/launcher3/taskbar/s;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s;->n(Lcom/android/launcher3/taskbar/s;)Ljava/lang/Runnable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Lcom/android/launcher3/taskbar/s;->q(Lcom/android/launcher3/taskbar/s;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method i(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s;->m(Lcom/android/launcher3/taskbar/s;)Lcom/android/quickstep/RecentsModel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->getIconCache()Lcom/android/quickstep/TaskIconCache;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/q;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/taskbar/q;-><init>(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/TaskIconCache;->getIconInBackground(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;)Lcom/android/launcher3/util/w;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method j(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s$a;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s;->m(Lcom/android/launcher3/taskbar/s;)Lcom/android/quickstep/RecentsModel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/r;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/taskbar/r;-><init>(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    .line 17
    .line 18
    .line 19
    return-void
.end method
