.class Lcom/android/launcher3/allapps/i0$h;
.super Ljava/lang/Object;
.source "PrivateProfileManager.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/i0;->Q(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/List;

.field final synthetic h:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field final synthetic i:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$h;->i:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/allapps/i0$h;->g:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/allapps/i0$h;->h:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$h;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$h;->g:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/android/launcher3/allapps/O$a;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0$h;->i:Lcom/android/launcher3/allapps/i0;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Lcom/android/launcher3/allapps/i0;->j0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget v1, v1, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 37
    .line 38
    const/16 v2, 0x40

    .line 39
    .line 40
    if-ne v1, v2, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$h;->i:Lcom/android/launcher3/allapps/i0;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/i0;->i0()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$h;->h:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 61
    .line 62
    .line 63
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return-void
.end method
