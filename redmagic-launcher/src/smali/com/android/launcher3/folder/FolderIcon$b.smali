.class Lcom/android/launcher3/folder/FolderIcon$b;
.super Ljava/lang/Object;
.source "FolderIcon.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/FolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/FolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon$b;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/c;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon$b;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/FolderIcon;->n(Lcom/android/launcher3/folder/FolderIcon;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon$b;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->I0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
