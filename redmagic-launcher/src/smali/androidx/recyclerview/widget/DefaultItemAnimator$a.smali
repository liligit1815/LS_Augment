.class Landroidx/recyclerview/widget/DefaultItemAnimator$a;
.super Ljava/lang/Object;
.source "DefaultItemAnimator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/recyclerview/widget/DefaultItemAnimator;->runPendingAnimations()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Landroidx/recyclerview/widget/DefaultItemAnimator;


# direct methods
.method constructor <init>(Landroidx/recyclerview/widget/DefaultItemAnimator;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->h:Landroidx/recyclerview/widget/DefaultItemAnimator;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;

    .line 18
    .line 19
    iget-object v2, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->h:Landroidx/recyclerview/widget/DefaultItemAnimator;

    .line 20
    .line 21
    iget-object v3, v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;->a:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 22
    .line 23
    iget v4, v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;->b:I

    .line 24
    .line 25
    iget v5, v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;->c:I

    .line 26
    .line 27
    iget v6, v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;->d:I

    .line 28
    .line 29
    iget v7, v1, Landroidx/recyclerview/widget/DefaultItemAnimator$j;->e:I

    .line 30
    .line 31
    invoke-virtual/range {v2 .. v7}, Landroidx/recyclerview/widget/DefaultItemAnimator;->animateMoveImpl(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IIII)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->g:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->h:Landroidx/recyclerview/widget/DefaultItemAnimator;

    .line 41
    .line 42
    iget-object v0, v0, Landroidx/recyclerview/widget/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object p0, p0, Landroidx/recyclerview/widget/DefaultItemAnimator$a;->g:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method
