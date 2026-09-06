.class Lcom/android/launcher3/globalsearch/d$d;
.super Lcom/android/launcher3/globalsearch/d$h;
.source "GSAppLocationAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/globalsearch/d;->n(Landroid/os/Handler;Lcom/android/launcher3/C2;JLcom/android/launcher3/model/data/p;ILcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/FolderPagedView;

.field final synthetic h:Landroid/os/Handler;

.field final synthetic i:Lcom/android/launcher3/C2;

.field final synthetic j:I

.field final synthetic k:Lcom/android/launcher3/globalsearch/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/folder/FolderPagedView;Landroid/os/Handler;Lcom/android/launcher3/C2;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d$d;->k:Lcom/android/launcher3/globalsearch/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d$d;->g:Lcom/android/launcher3/folder/FolderPagedView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/d$d;->h:Landroid/os/Handler;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/globalsearch/d$d;->i:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/globalsearch/d$d;->j:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/d$h;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/globalsearch/e;)V

    .line 13
    .line 14
    .line 15
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
    const-string v1, "snapFolder--runEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->g:Lcom/android/launcher3/folder/FolderPagedView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->k:Lcom/android/launcher3/globalsearch/d;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$d;->h:Landroid/os/Handler;

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
    const-string v0, "snapFolder--run"

    .line 2
    .line 3
    const-string v1, "Global_Search_GSAppLocationAnim"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, "snapFolderAnimation end, for the openFolder is null!"

    .line 17
    .line 18
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/d$d;->b()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->g:Lcom/android/launcher3/folder/FolderPagedView;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/FolderPagedView;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->g:Lcom/android/launcher3/folder/FolderPagedView;

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/globalsearch/d$d;->j:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->isSnapToCrossScreenAlreadyIn(I)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/d$d;->b()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$d;->g:Lcom/android/launcher3/folder/FolderPagedView;

    .line 45
    .line 46
    iget p0, p0, Lcom/android/launcher3/globalsearch/d$d;->j:I

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageSnapAnimationDuration()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/V4;->snapToCrossScreen(II)Z

    .line 53
    .line 54
    .line 55
    return-void
.end method
