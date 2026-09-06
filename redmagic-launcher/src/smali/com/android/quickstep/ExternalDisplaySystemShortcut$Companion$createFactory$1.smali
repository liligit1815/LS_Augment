.class public final Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion$createFactory$1;
.super Ljava/lang/Object;
.source "ExternalDisplaySystemShortcut.kt"

# interfaces
.implements Lcom/android/quickstep/TaskShortcutFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;->createFactory(Lcom/android/launcher3/b;)Lcom/android/quickstep/TaskShortcutFactory;
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
    iput-object p1, p0, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion$createFactory$1;->$abstractFloatingViewHelper:Lcom/android/launcher3/b;

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
            "Lcom/android/quickstep/ExternalDisplaySystemShortcut;",
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
    invoke-static {}, LG2/c;->i()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    return-object v8

    .line 44
    :cond_1
    iget-object v0, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseActivity:Landroid/content/ComponentName;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    move-object v3, v0

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move-object v3, v8

    .line 55
    :goto_0
    iget v4, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->numActivities:I

    .line 56
    .line 57
    iget-boolean v5, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->isTopActivityNoDisplay:Z

    .line 58
    .line 59
    iget-boolean v6, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->isActivityStackTransparent:Z

    .line 60
    .line 61
    iget v7, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 62
    .line 63
    invoke-virtual/range {v2 .. v7}, LO2/a;->f(Ljava/lang/String;IZZI)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    return-object v8

    .line 70
    :cond_3
    new-instance v0, Lcom/android/quickstep/ExternalDisplaySystemShortcut;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion$createFactory$1;->$abstractFloatingViewHelper:Lcom/android/launcher3/b;

    .line 73
    .line 74
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/ExternalDisplaySystemShortcut;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/b;Lcom/android/quickstep/views/TaskContainer;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public showForGroupedTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
