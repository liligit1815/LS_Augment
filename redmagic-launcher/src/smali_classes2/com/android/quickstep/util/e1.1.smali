.class public final synthetic Lcom/android/quickstep/util/e1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/SplitToWorkspaceController;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Landroid/content/Intent;

.field public final synthetic d:Landroid/os/UserHandle;

.field public final synthetic e:Landroid/view/View;

.field public final synthetic f:Ls1/d;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/e1;->a:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/e1;->b:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/e1;->c:Landroid/content/Intent;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/e1;->d:Landroid/os/UserHandle;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/e1;->e:Landroid/view/View;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/util/e1;->f:Ls1/d;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/e1;->a:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/e1;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/e1;->c:Landroid/content/Intent;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/e1;->d:Landroid/os/UserHandle;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/e1;->e:Landroid/view/View;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/e1;->f:Ls1/d;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    check-cast v6, [Lcom/android/systemui/shared/recents/model/Task;

    .line 15
    .line 16
    invoke-static/range {v0 .. v6}, Lcom/android/quickstep/util/SplitToWorkspaceController;->b(Lcom/android/quickstep/util/SplitToWorkspaceController;Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
