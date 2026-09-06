.class public final synthetic Lcom/android/launcher3/taskbar/l4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:Lcom/android/launcher3/model/data/z;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/model/data/z;Landroid/view/View;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/l4;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/l4;->b:Lcom/android/launcher3/model/data/z;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/l4;->c:Landroid/view/View;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/taskbar/l4;->d:Landroid/content/Intent;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/l4;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/l4;->b:Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/l4;->c:Landroid/view/View;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l4;->d:Landroid/content/Intent;

    .line 8
    .line 9
    check-cast p1, [Lcom/android/systemui/shared/recents/model/Task;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/taskbar/o4;->d(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/model/data/z;Landroid/view/View;Landroid/content/Intent;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
