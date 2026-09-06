.class Lcom/android/quickstep/TaskShortcutFactory$10;
.super Ljava/lang/Object;
.source "TaskShortcutFactory.java"

# interfaces
.implements Lcom/android/quickstep/TaskShortcutFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/quickstep/TaskShortcutFactory$CloseSystemShortcut;

    .line 2
    .line 3
    const v0, 0x7f080d63

    .line 4
    .line 5
    .line 6
    const v1, 0x7f140323

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/quickstep/TaskShortcutFactory$CloseSystemShortcut;-><init>(IILcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public showForDesktopTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public showForGroupedTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
