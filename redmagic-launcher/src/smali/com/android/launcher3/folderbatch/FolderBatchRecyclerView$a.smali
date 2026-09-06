.class Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView$a;
.super Ljava/lang/Object;
.source "FolderBatchRecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;->requestFocus(ILandroid/graphics/Rect;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView$a;->g:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

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
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView$a;->g:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
