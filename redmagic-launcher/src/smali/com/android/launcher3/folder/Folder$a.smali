.class Lcom/android/launcher3/folder/Folder$a;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Landroid/text/TextWatcher;


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
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->w0(Lcom/android/launcher3/folder/Folder;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-ge p1, v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 24
    .line 25
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/widget/EditText;->hasFocus()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->l0(Lcom/android/launcher3/folder/Folder;)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move-object p0, v1

    .line 47
    :goto_0
    invoke-virtual {p1, v1, v1, p0, v1}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
