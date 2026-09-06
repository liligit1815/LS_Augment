.class public final Lcom/android/launcher3/taskbar/b0;
.super Lcom/android/launcher3/popup/P;
.source "ManageWindowsTaskbarShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/b0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/P<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/model/data/y;

.field private final i:Landroid/view/View;

.field private final j:Lcom/android/launcher3/taskbar/R1;

.field private k:Lcom/android/launcher3/taskbar/b0$a;

.field private final l:Lcom/android/quickstep/RecentsModel;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/taskbar/R1;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Lcom/android/launcher3/taskbar/R1;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "originalView"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "controllers"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const v3, 0x7f140243

    .line 12
    .line 13
    .line 14
    move-object v4, p1

    .line 15
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    const v2, 0x7f080aa8

    .line 18
    .line 19
    .line 20
    move-object v1, p0

    .line 21
    move-object v5, p2

    .line 22
    move-object v6, p3

    .line 23
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, v1, Lcom/android/launcher3/taskbar/b0;->g:Landroid/content/Context;

    .line 27
    .line 28
    iput-object v5, v1, Lcom/android/launcher3/taskbar/b0;->h:Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    iput-object v6, v1, Lcom/android/launcher3/taskbar/b0;->i:Landroid/view/View;

    .line 31
    .line 32
    iput-object p4, v1, Lcom/android/launcher3/taskbar/b0;->j:Lcom/android/launcher3/taskbar/R1;

    .line 33
    .line 34
    sget-object p0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 35
    .line 36
    iget-object p1, p4, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 43
    .line 44
    iput-object p0, v1, Lcom/android/launcher3/taskbar/b0;->l:Lcom/android/quickstep/RecentsModel;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic J(Lcom/android/launcher3/taskbar/b0;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/b0;->S(Lcom/android/launcher3/taskbar/b0;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K(Lcom/android/launcher3/taskbar/b0;Ljava/lang/Integer;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/b0;->R(Lcom/android/launcher3/taskbar/b0;Ljava/lang/Integer;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L(Ljava/lang/String;Ljava/lang/Integer;Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/b0;->V(Ljava/lang/String;Ljava/lang/Integer;Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic M(Lu4/l;Lcom/android/launcher3/taskbar/b0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/b0;->W(Lu4/l;Lcom/android/launcher3/taskbar/b0;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/b0;->U(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic O(Lcom/android/launcher3/taskbar/b0;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method private final Q(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v4, Lcom/android/launcher3/taskbar/Z;

    .line 2
    .line 3
    invoke-direct {v4, p0}, Lcom/android/launcher3/taskbar/Z;-><init>(Lcom/android/launcher3/taskbar/b0;)V

    .line 4
    .line 5
    .line 6
    new-instance v5, Lcom/android/launcher3/taskbar/a0;

    .line 7
    .line 8
    invoke-direct {v5, p0}, Lcom/android/launcher3/taskbar/a0;-><init>(Lcom/android/launcher3/taskbar/b0;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/b0$a;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/b0;->i:Landroid/view/View;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/taskbar/b0;->j:Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 18
    .line 19
    invoke-virtual {v2}, La2/e;->s()La2/a;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "requestWindow(...)"

    .line 24
    .line 25
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v6, p0, Lcom/android/launcher3/taskbar/b0;->j:Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    move-object v3, p1

    .line 31
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/b0$a;-><init>(Landroid/view/View;La2/a;Ljava/util/ArrayList;Lu4/l;Lu4/a;Lcom/android/launcher3/taskbar/R1;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/taskbar/b0;->k:Lcom/android/launcher3/taskbar/b0$a;

    .line 35
    .line 36
    invoke-virtual {v0}, LR2/b;->h()LR2/b$b;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Lcom/android/launcher3/taskbar/b0$b;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/b0$b;-><init>(Lcom/android/launcher3/taskbar/b0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private static final R(Lcom/android/launcher3/taskbar/b0;Ljava/lang/Integer;)Lh4/t;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0;->k:Lcom/android/launcher3/taskbar/b0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "taskbarShortcutAllWindowsView"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, LR2/b;->c()V

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0;->g:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    sget-object v0, LO2/f;->k:LO2/f;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 37
    .line 38
    return-object p0
.end method

.method private static final S(Lcom/android/launcher3/taskbar/b0;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0;->k:Lcom/android/launcher3/taskbar/b0$a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "taskbarShortcutAllWindowsView"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, LR2/b;->c()V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 15
    .line 16
    return-object p0
.end method

.method private final T(Ljava/util/List;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/taskbar/b0;->l:Lcom/android/quickstep/RecentsModel;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    new-instance v3, Lcom/android/launcher3/taskbar/Y;

    .line 29
    .line 30
    invoke-direct {v3, p2, v1, v0, p0}, Lcom/android/launcher3/taskbar/Y;-><init>(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1, v3}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method private static final U(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 1

    .line 1
    const-string v0, "thumbnailData"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 24
    .line 25
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 26
    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p4}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-static {p1, p4}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    invoke-direct {p3, p2}, Lcom/android/launcher3/taskbar/b0;->Q(Ljava/util/ArrayList;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method private static final V(Ljava/lang/String;Ljava/lang/Integer;Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 1

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    iget-object p0, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 23
    .line 24
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-ne p0, p1, :cond_2

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method private static final W(Lu4/l;Lcom/android/launcher3/taskbar/b0;Ljava/util/List;)V
    .locals 4

    .line 1
    const-string v0, "tasks"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    instance-of v3, v2, Lcom/android/quickstep/util/DesktopTask;

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-static {v0}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/quickstep/util/DesktopTask;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    :cond_2
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_5

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-interface {p0, v2}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_4

    .line 81
    .line 82
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_6

    .line 100
    .line 101
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/android/quickstep/util/GroupTask;

    .line 106
    .line 107
    invoke-virtual {v2}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v0, v2}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_6
    new-instance p2, Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :cond_7
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_8

    .line 129
    .line 130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    move-object v3, v2

    .line 135
    check-cast v3, Lcom/android/systemui/shared/recents/model/Task;

    .line 136
    .line 137
    invoke-interface {p0, v3}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_7

    .line 148
    .line 149
    invoke-interface {p2, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_8
    invoke-static {v1, p2}, Li4/m;->r0(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    new-instance p2, Ljava/util/HashSet;

    .line 158
    .line 159
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 160
    .line 161
    .line 162
    new-instance v0, Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    :cond_9
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_a

    .line 176
    .line 177
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    move-object v2, v1

    .line 182
    check-cast v2, Lcom/android/systemui/shared/recents/model/Task;

    .line 183
    .line 184
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 185
    .line 186
    iget v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 187
    .line 188
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-eqz v2, :cond_9

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_a
    new-instance p0, Ljava/util/ArrayList;

    .line 203
    .line 204
    const/16 p2, 0xa

    .line 205
    .line 206
    invoke-static {v0, p2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 211
    .line 212
    .line 213
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_b

    .line 222
    .line 223
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 230
    .line 231
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 232
    .line 233
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_b
    invoke-static {p0}, Li4/m;->H0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-direct {p1, v0, p0}, Lcom/android/launcher3/taskbar/b0;->T(Ljava/util/List;Ljava/util/Set;)V

    .line 246
    .line 247
    .line 248
    return-void
.end method


# virtual methods
.method public final P()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0;->k:Lcom/android/launcher3/taskbar/b0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "taskbarShortcutAllWindowsView"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-virtual {p0}, LR2/b;->c()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/b0;->h:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object p1, v0

    .line 12
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/b0;->h:Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_1
    new-instance v1, Lcom/android/launcher3/taskbar/W;

    .line 29
    .line 30
    invoke-direct {v1, p1, v0}, Lcom/android/launcher3/taskbar/W;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/taskbar/b0;->l:Lcom/android/quickstep/RecentsModel;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/taskbar/X;

    .line 36
    .line 37
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/taskbar/X;-><init>(Lu4/l;Lcom/android/launcher3/taskbar/b0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method
