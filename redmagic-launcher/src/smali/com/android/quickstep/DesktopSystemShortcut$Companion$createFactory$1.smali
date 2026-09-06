.class public final Lcom/android/quickstep/DesktopSystemShortcut$Companion$createFactory$1;
.super Ljava/lang/Object;
.source "DesktopSystemShortcut.kt"

# interfaces
.implements Lcom/android/quickstep/TaskShortcutFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/DesktopSystemShortcut$Companion;->createFactory(Lcom/android/launcher3/b;)Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $abstractFloatingViewHelper:Lcom/android/launcher3/b;


# direct methods
.method constructor <init>(Lcom/android/launcher3/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/DesktopSystemShortcut$Companion$createFactory$1;->$abstractFloatingViewHelper:Lcom/android/launcher3/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/quickstep/DesktopSystemShortcut;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskContainer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 20
    .line 21
    new-instance v2, LO2/a;

    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v2, v0}, LO2/a;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v8, 0x0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    return-object v8

    .line 37
    :cond_0
    iget-object v0, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseActivity:Landroid/content/ComponentName;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    move-object v3, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object v3, v8

    .line 48
    :goto_0
    iget v4, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->numActivities:I

    .line 49
    .line 50
    iget-boolean v5, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->isTopActivityNoDisplay:Z

    .line 51
    .line 52
    iget-boolean v6, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->isActivityStackTransparent:Z

    .line 53
    .line 54
    iget v7, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 55
    .line 56
    invoke-virtual/range {v2 .. v7}, LO2/a;->f(Ljava/lang/String;IZZI)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    return-object v8

    .line 63
    :cond_2
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-boolean v0, v0, Lcom/android/systemui/shared/recents/model/Task;->isDockable:Z

    .line 68
    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    return-object v8

    .line 72
    :cond_3
    new-instance v0, Lcom/android/quickstep/DesktopSystemShortcut;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/quickstep/DesktopSystemShortcut$Companion$createFactory$1;->$abstractFloatingViewHelper:Lcom/android/launcher3/b;

    .line 75
    .line 76
    invoke-direct {v0, p1, p2, p0}, Lcom/android/quickstep/DesktopSystemShortcut;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/launcher3/b;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public showForGroupedTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
