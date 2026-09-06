.class Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;
.super Lcom/android/launcher3/anim/g;
.source "AllAppsSortMenuView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->Q(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;->h:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;->h:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;->h:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->O(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
