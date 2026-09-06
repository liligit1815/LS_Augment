.class Lcom/android/launcher3/folder/Folder$g;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/Folder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$g;->g:Lcom/android/launcher3/folder/Folder;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$g;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 4
    .line 5
    iget v1, p1, Lcom/android/launcher3/folder/Folder;->A:I

    .line 6
    .line 7
    iget p1, p1, Lcom/android/launcher3/folder/Folder;->y:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/folder/FolderPagedView;->q0(II)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$g;->g:Lcom/android/launcher3/folder/Folder;

    .line 13
    .line 14
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 15
    .line 16
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 17
    .line 18
    return-void
.end method
