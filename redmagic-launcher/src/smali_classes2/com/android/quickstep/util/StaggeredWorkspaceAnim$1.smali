.class Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StaggeredWorkspaceAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/StaggeredWorkspaceAnim;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;FZLandroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$hotseat:Lcom/android/launcher3/Hotseat;

.field final synthetic val$hotseatClipChildren:Z

.field final synthetic val$hotseatClipToPadding:Z

.field final synthetic val$workspace:Lcom/android/launcher3/Workspace;

.field final synthetic val$workspaceClipChildren:Z

.field final synthetic val$workspaceClipToPadding:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Lcom/android/launcher3/Workspace;ZZLcom/android/launcher3/Hotseat;ZZ)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspace:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspaceClipChildren:Z

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspaceClipToPadding:Z

    .line 6
    .line 7
    iput-object p5, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseat:Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    iput-boolean p6, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseatClipChildren:Z

    .line 10
    .line 11
    iput-boolean p7, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseatClipToPadding:Z

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspace:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspaceClipChildren:Z

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspace:Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$workspaceClipToPadding:Z

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseat:Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseatClipChildren:Z

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseat:Lcom/android/launcher3/Hotseat;

    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;->val$hotseatClipToPadding:Z

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
