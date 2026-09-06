.class public final synthetic Lcom/android/launcher3/taskbar/D3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;


# instance fields
.field public final synthetic a:Lcom/android/systemui/shared/recents/model/Task;

.field public final synthetic b:Lcom/android/launcher3/taskbar/F3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/F3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/D3;->a:Lcom/android/systemui/shared/recents/model/Task;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/D3;->b:Lcom/android/launcher3/taskbar/F3;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onTaskIconReceived(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/D3;->a:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/D3;->b:Lcom/android/launcher3/taskbar/F3;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/F3;->b(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/F3;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
