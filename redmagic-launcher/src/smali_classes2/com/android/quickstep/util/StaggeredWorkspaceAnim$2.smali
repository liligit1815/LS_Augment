.class Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StaggeredWorkspaceAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addAnimationForPage(Lcom/android/launcher3/CellLayout;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$page:Lcom/android/launcher3/CellLayout;

.field final synthetic val$pageClipChildren:Z

.field final synthetic val$pageClipToPadding:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Lcom/android/launcher3/CellLayout;ZZ)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$page:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$pageClipChildren:Z

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$pageClipToPadding:Z

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$page:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$pageClipChildren:Z

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$page:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;->val$pageClipToPadding:Z

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
