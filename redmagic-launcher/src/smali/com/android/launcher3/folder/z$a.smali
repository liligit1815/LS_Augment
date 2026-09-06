.class Lcom/android/launcher3/folder/z$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderAnimationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/z;->c()Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/CellLayout;

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:Z

.field final synthetic n:Lcom/android/launcher3/folder/z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTranslationZ(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 31
    .line 32
    const/high16 v1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setAlpha(F)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 87
    .line 88
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z$a;->h:Z

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 96
    .line 97
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z$a;->i:Z

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 105
    .line 106
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z$a;->j:Z

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 114
    .line 115
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z$a;->k:Z

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 121
    .line 122
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z$a;->l:Z

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 128
    .line 129
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z$a;->m:Z

    .line 130
    .line 131
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getClipChildren()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->h:Z

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getClipToPadding()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->i:Z

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->j:Z

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->k:Z

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->l:Z

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput-boolean p1, p0, Lcom/android/launcher3/folder/z$a;->m:Z

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->n:Lcom/android/launcher3/folder/z;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/folder/z$a;->g:Lcom/android/launcher3/CellLayout;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
