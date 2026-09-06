.class public Lcom/android/launcher3/folderbatch/h;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "FolderBatchViewHolder.java"


# instance fields
.field a:Lcom/android/launcher3/BubbleTextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/h;->a:Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method protected a()Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/h;->a:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    return-object p0
.end method
