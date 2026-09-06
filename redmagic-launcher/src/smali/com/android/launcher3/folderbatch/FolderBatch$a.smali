.class Lcom/android/launcher3/folderbatch/FolderBatch$a;
.super Ljava/lang/Object;
.source "FolderBatch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folderbatch/FolderBatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folderbatch/FolderBatch;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folderbatch/FolderBatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->S(Lcom/android/launcher3/folderbatch/FolderBatch;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/widget/EditText;->isFocused()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->t0()V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->clearFocus()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch$a;->g:Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 96
    .line 97
    .line 98
    return-void
.end method
