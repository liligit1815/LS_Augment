.class Lcom/android/launcher3/globalsearch/d$c;
.super Lcom/android/launcher3/globalsearch/d$h;
.source "GSAppLocationAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/globalsearch/d;->m(Landroid/os/Handler;JLcom/android/launcher3/model/data/p;Lcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/FolderIcon;

.field final synthetic h:Landroid/os/Handler;

.field final synthetic i:Lcom/android/launcher3/globalsearch/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/folder/FolderIcon;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d$c;->i:Lcom/android/launcher3/globalsearch/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d$c;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/d$c;->h:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/d$h;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/globalsearch/e;)V

    .line 9
    .line 10
    .line 11
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
    const-string v1, "animOpenFolder--runEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$c;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/Folder;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$c;->i:Lcom/android/launcher3/globalsearch/d;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$c;->h:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-static {v0, p0}, Lcom/android/launcher3/globalsearch/d;->d(Lcom/android/launcher3/globalsearch/d;Landroid/os/Handler;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    const-string v0, "Global_Search_GSAppLocationAnim"

    .line 2
    .line 3
    const-string v1, "animOpenFolder--run"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$c;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/Folder;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$c;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
