.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;
.super Ljava/lang/Object;
.source "TransformFolderIcon.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->x1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->K0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->d2()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->H0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
