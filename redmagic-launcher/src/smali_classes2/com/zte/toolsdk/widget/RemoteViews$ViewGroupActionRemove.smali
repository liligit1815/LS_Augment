.class Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewGroupActionRemove"
.end annotation


# static fields
.field private static final REMOVE_ALL_VIEWS_ID:I = -0x2


# instance fields
.field private mViewIdToKeep:I


# direct methods
.method constructor <init>(I)V
    .locals 1

    const/4 v0, -0x2

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;-><init>(II)V

    return-void
.end method

.method constructor <init>(II)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 3
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 4
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->lambda$initActionAsync$1(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->T(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->removeAllViewsExceptIdToKeep(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$initActionAsync$1(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 10
    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private removeAllViewsExceptIdToKeep(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 18
    .line 19
    if-eq v1, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 13
    .line 14
    const/4 p3, -0x2

    .line 15
    if-ne p2, p3, :cond_3

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/lit8 p0, p0, -0x1

    .line 22
    .line 23
    :goto_0
    if-ltz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->T(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    add-int/lit8 p0, p0, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-static {p1, p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->removeAllViewsExceptIdToKeep(Landroid/view/ViewGroup;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/4 p0, 0x7

    .line 2
    return p0
.end method

.method public initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->createTree()V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    instance-of p2, p2, Landroid/view/ViewGroup;

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 28
    .line 29
    const/4 v0, -0x2

    .line 30
    if-ne p3, v0, :cond_1

    .line 31
    .line 32
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    new-instance v0, Lcom/zte/toolsdk/widget/x;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/x;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/4 p3, 0x0

    .line 53
    invoke-static {p2, p3, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    new-instance v0, Lcom/zte/toolsdk/widget/y;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/y;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-eqz p3, :cond_2

    .line 78
    .line 79
    const/4 p3, 0x0

    .line 80
    invoke-static {p1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->c(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Ljava/util/ArrayList;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;

    .line 84
    .line 85
    invoke-direct {p1, p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;Landroid/view/ViewGroup;)V

    .line 86
    .line 87
    .line 88
    return-object p1

    .line 89
    :cond_3
    :goto_1
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method

.method public mergeBehavior()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->mViewIdToKeep:I

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
