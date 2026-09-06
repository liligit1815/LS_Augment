.class Lcom/android/launcher3/folder/FolderNameEditText$a;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "FolderNameEditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/FolderNameEditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/folder/FolderNameEditText;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/FolderNameEditText;Landroid/view/inputmethod/InputConnection;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderNameEditText$a;->a:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public setComposingText(Ljava/lang/CharSequence;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderNameEditText$a;->a:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/android/launcher3/folder/FolderNameEditText;->q(Lcom/android/launcher3/folder/FolderNameEditText;Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->setComposingText(Ljava/lang/CharSequence;I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
