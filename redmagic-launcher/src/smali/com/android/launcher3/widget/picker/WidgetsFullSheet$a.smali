.class Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;
.super Ljava/lang/Object;
.source "WidgetsFullSheet.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->j:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 25
    .line 26
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/s0;->b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
