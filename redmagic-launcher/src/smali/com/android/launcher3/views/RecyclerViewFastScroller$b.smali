.class Lcom/android/launcher3/views/RecyclerViewFastScroller$b;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "RecyclerViewFastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/views/RecyclerViewFastScroller;->setRecyclerView(Lcom/android/launcher3/s0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/views/RecyclerViewFastScroller;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/RecyclerViewFastScroller;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller$b;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller$b;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    iput p3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->j:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 6
    .line 7
    invoke-virtual {p0, p3}, Lcom/android/launcher3/s0;->d(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
