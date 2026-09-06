.class public final synthetic Lcom/android/launcher3/folder/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/folder/FolderNameEditText;

.field public final synthetic h:[Landroid/view/inputmethod/CompletionInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/FolderNameEditText;[Landroid/view/inputmethod/CompletionInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/I;->g:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/folder/I;->h:[Landroid/view/inputmethod/CompletionInfo;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/I;->g:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/I;->h:[Landroid/view/inputmethod/CompletionInfo;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/folder/FolderNameEditText;->p(Lcom/android/launcher3/folder/FolderNameEditText;[Landroid/view/inputmethod/CompletionInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
