.class public final synthetic Lcom/android/launcher3/taskbar/A3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/F3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/F3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/A3;->a:Lcom/android/launcher3/taskbar/F3;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onRecentTasksChanged()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/A3;->a:Lcom/android/launcher3/taskbar/F3;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/F3;->f(Lcom/android/launcher3/taskbar/F3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
