.class Lcom/android/launcher3/allapps/i0$d;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "PrivateProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/i0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$d;->g:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$d;->g:Lcom/android/launcher3/allapps/i0;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Lcom/android/launcher3/allapps/i0;->J(Lcom/android/launcher3/allapps/i0;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
