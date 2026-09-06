.class public abstract Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;
.source "BaseSinkTitleBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$c<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->h:I

    .line 6
    .line 7
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 8
    .line 9
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->j:I

    .line 10
    .line 11
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->g:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public I(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public J(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setTitleViewWidth. mPrimaryTitleWidth="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", width="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "BS#TitleBehavior4"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 34
    .line 35
    return-void
.end method

.method public i(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p3, Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    return p0
.end method
