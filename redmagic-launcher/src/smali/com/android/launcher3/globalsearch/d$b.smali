.class Lcom/android/launcher3/globalsearch/d$b;
.super Lcom/android/launcher3/globalsearch/d$h;
.source "GSAppLocationAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/globalsearch/d;->o(Landroid/os/Handler;JLcom/android/launcher3/Workspace;I)Lcom/android/launcher3/globalsearch/d$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/Workspace;

.field final synthetic h:Landroid/os/Handler;

.field final synthetic i:I

.field final synthetic j:Lcom/android/launcher3/globalsearch/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/Workspace;Landroid/os/Handler;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d$b;->j:Lcom/android/launcher3/globalsearch/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d$b;->g:Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/d$b;->h:Landroid/os/Handler;

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/globalsearch/d$b;->i:I

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/d$h;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/globalsearch/e;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const-string v0, "Global_Search_GSAppLocationAnim"

    .line 2
    .line 3
    const-string v1, "animWorkspacePageSnap--runEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$b;->g:Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$b;->j:Lcom/android/launcher3/globalsearch/d;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$b;->h:Landroid/os/Handler;

    .line 17
    .line 18
    invoke-static {v0, p0}, Lcom/android/launcher3/globalsearch/d;->d(Lcom/android/launcher3/globalsearch/d;Landroid/os/Handler;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    const-string v0, "Global_Search_GSAppLocationAnim"

    .line 2
    .line 3
    const-string v1, "animWorkspacePageSnap--run"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$b;->g:Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/android/launcher3/Workspace;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$b;->g:Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    iget v1, p0, Lcom/android/launcher3/globalsearch/d$b;->i:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->isSnapToCrossScreenAlreadyIn(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/d$b;->b()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$b;->g:Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    iget p0, p0, Lcom/android/launcher3/globalsearch/d$b;->i:I

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageSnapAnimationDuration()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/V4;->snapToCrossScreen(II)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method
