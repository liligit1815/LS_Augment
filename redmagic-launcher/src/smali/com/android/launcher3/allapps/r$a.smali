.class Lcom/android/launcher3/allapps/r$a;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "ActivityAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/r;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$a;->g:Lcom/android/launcher3/allapps/r;

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
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$a;->g:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->F0(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
