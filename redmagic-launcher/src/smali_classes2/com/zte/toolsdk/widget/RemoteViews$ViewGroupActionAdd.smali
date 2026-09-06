.class Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewGroupActionAdd"
.end annotation


# static fields
.field static final NO_ID:I = -0x1


# instance fields
.field private mIndex:I

.field private mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

.field private mStableId:I

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 6

    const/4 v4, -0x1

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;II)V

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;I)V
    .locals 6

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .line 2
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;II)V

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;II)V
    .locals 1

    .line 3
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 4
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 6
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mIndex:I

    .line 7
    iput p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 8
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p0

    invoke-static {p3, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->z(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;Landroid/content/pm/ApplicationInfo;I)V
    .locals 7

    .line 9
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 10
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 11
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mIndex:I

    .line 12
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 13
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object v3

    const/4 v6, 0x0

    move-object v2, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v1 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;ILcom/zte/toolsdk/widget/z;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->j(Lcom/zte/toolsdk/widget/RemoteViews;)I

    move-result p0

    invoke-virtual {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->lambda$initActionAsync$0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Landroid/view/ViewGroup;II)V
    .locals 0

    .line 1
    sub-int/2addr p2, p1

    .line 2
    add-int/lit8 p2, p2, 0x1

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method private findViewIndexToRecycle(Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews;)I
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->P(Landroid/view/ViewGroup;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p2, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->S(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    return p2

    .line 24
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, -0x1

    .line 28
    return p0
.end method

.method private insertNewView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Runnable;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 8

    .line 1
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v3, v0

    .line 6
    check-cast v3, Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->P(Landroid/view/ViewGroup;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    move-object v2, p1

    .line 18
    move-object v5, p3

    .line 19
    invoke-static/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews;->C(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/util/SizeF;Landroid/view/View;)Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 p3, 0x0

    .line 24
    new-array p3, p3, [Ljava/lang/Void;

    .line 25
    .line 26
    invoke-virtual {p1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->doInBackground([Ljava/lang/Void;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    if-eqz v4, :cond_3

    .line 31
    .line 32
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    if-eq p3, v1, :cond_0

    .line 36
    .line 37
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->b(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 42
    .line 43
    invoke-static {p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->V(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mIndex:I

    .line 47
    .line 48
    if-ltz p3, :cond_1

    .line 49
    .line 50
    move v7, p3

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move v7, v0

    .line 53
    :goto_0
    invoke-virtual {p2, v4, v7}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->addChild(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;I)V

    .line 54
    .line 55
    .line 56
    if-ltz v0, :cond_2

    .line 57
    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-static {v3, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 69
    .line 70
    .line 71
    :cond_2
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;

    .line 72
    .line 73
    move-object v2, p0

    .line 74
    move-object v5, p4

    .line 75
    move-object v6, v3

    .line 76
    move-object v3, p1

    .line 77
    invoke-direct/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Ljava/lang/Runnable;Landroid/view/ViewGroup;I)V

    .line 78
    .line 79
    .line 80
    return-object v1

    .line 81
    :cond_3
    move-object v3, p1

    .line 82
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 83
    .line 84
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->a(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Ljava/lang/Exception;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Exception;)V

    .line 89
    .line 90
    .line 91
    throw p0
.end method

.method private synthetic lambda$initActionAsync$0(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->S(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    move-object v2, p1

    .line 12
    check-cast v2, Landroid/view/ViewGroup;

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-static {v2}, Lcom/zte/toolsdk/widget/RemoteViews;->P(Landroid/view/ViewGroup;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->D(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 28
    .line 29
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->j(Lcom/zte/toolsdk/widget/RemoteViews;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    and-int/lit8 v3, v3, 0x6

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    const/4 v6, -0x1

    .line 41
    if-ltz p1, :cond_4

    .line 42
    .line 43
    iget v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 44
    .line 45
    if-eq v3, v6, :cond_4

    .line 46
    .line 47
    invoke-direct {p0, v2, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->findViewIndexToRecycle(Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-ltz v3, :cond_4

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v0, v4}, Lcom/zte/toolsdk/widget/RemoteViews;->canRecycleView(Landroid/view/View;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_3

    .line 62
    .line 63
    if-ge p1, v3, :cond_2

    .line 64
    .line 65
    sub-int/2addr v3, p1

    .line 66
    invoke-virtual {v2, p1, v3}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 67
    .line 68
    .line 69
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-static {v2, p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1, v4, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->J(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    sub-int/2addr v3, p1

    .line 83
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    invoke-virtual {v2, p1, v3}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 86
    .line 87
    .line 88
    :cond_4
    const/4 v4, 0x0

    .line 89
    move-object v3, p2

    .line 90
    move-object v5, p3

    .line 91
    invoke-static/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews;->y(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 96
    .line 97
    if-eq p3, v6, :cond_5

    .line 98
    .line 99
    invoke-static {p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->V(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    :cond_5
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mIndex:I

    .line 103
    .line 104
    if-ltz p0, :cond_6

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    move p0, p1

    .line 108
    :goto_0
    invoke-virtual {v2, p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    if-ltz p1, :cond_7

    .line 112
    .line 113
    add-int/lit8 p1, p1, 0x1

    .line 114
    .line 115
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {v2, p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 120
    .line 121
    .line 122
    :cond_7
    :goto_1
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 8

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
    move-result-object p2

    .line 10
    if-eqz p2, :cond_5

    .line 11
    .line 12
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :cond_0
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    move-object v3, v0

    .line 27
    check-cast v3, Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->P(Landroid/view/ViewGroup;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-ltz p1, :cond_4

    .line 42
    .line 43
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    if-eq v0, v1, :cond_4

    .line 47
    .line 48
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 49
    .line 50
    invoke-static {v0, v2}, Lcom/zte/toolsdk/widget/RemoteViews;->D(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v0, Lcom/zte/toolsdk/widget/u;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/u;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findChildIndex(ILjava/util/function/Predicate;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-ltz v0, :cond_4

    .line 64
    .line 65
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 74
    .line 75
    invoke-static {v4}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v1, v5}, Lcom/zte/toolsdk/widget/RemoteViews;->canRecycleView(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eqz v5, :cond_3

    .line 84
    .line 85
    if-le v0, p1, :cond_1

    .line 86
    .line 87
    sub-int v5, v0, p1

    .line 88
    .line 89
    invoke-virtual {p2, p1, v5}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->removeChildren(II)V

    .line 90
    .line 91
    .line 92
    :cond_1
    add-int/lit8 v5, p1, 0x1

    .line 93
    .line 94
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-static {v3, v5, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->U(Landroid/view/ViewGroup;II)V

    .line 103
    .line 104
    .line 105
    const/4 v6, 0x0

    .line 106
    invoke-static {v4}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    const/4 v4, 0x0

    .line 111
    move-object v5, p3

    .line 112
    invoke-static/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews;->C(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/util/SizeF;Landroid/view/View;)Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    const/4 p3, 0x0

    .line 117
    new-array p3, p3, [Ljava/lang/Void;

    .line 118
    .line 119
    invoke-virtual {p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->doInBackground([Ljava/lang/Void;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    if-eqz v4, :cond_2

    .line 124
    .line 125
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;

    .line 126
    .line 127
    move-object v2, p0

    .line 128
    move v6, p1

    .line 129
    move v5, v0

    .line 130
    move-object v7, v3

    .line 131
    move-object v3, p2

    .line 132
    invoke-direct/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;IILandroid/view/ViewGroup;)V

    .line 133
    .line 134
    .line 135
    return-object v1

    .line 136
    :cond_2
    move-object v3, p2

    .line 137
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 138
    .line 139
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->a(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Ljava/lang/Exception;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Exception;)V

    .line 144
    .line 145
    .line 146
    throw p0

    .line 147
    :cond_3
    move-object v5, v2

    .line 148
    move-object v2, p0

    .line 149
    move-object p0, v5

    .line 150
    move v6, p1

    .line 151
    move-object v5, p3

    .line 152
    move p1, v0

    .line 153
    sub-int v0, p1, v6

    .line 154
    .line 155
    add-int/lit8 v0, v0, 0x1

    .line 156
    .line 157
    invoke-virtual {p2, v6, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->removeChildren(II)V

    .line 158
    .line 159
    .line 160
    new-instance p3, Lcom/zte/toolsdk/widget/v;

    .line 161
    .line 162
    invoke-direct {p3, v3, v6, p1}, Lcom/zte/toolsdk/widget/v;-><init>(Landroid/view/ViewGroup;II)V

    .line 163
    .line 164
    .line 165
    invoke-direct {v2, p0, p2, v5, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->insertNewView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Runnable;)Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0

    .line 170
    :cond_4
    move-object v5, v2

    .line 171
    move-object v2, p0

    .line 172
    move-object p0, v5

    .line 173
    move-object v5, p3

    .line 174
    new-instance p1, Lcom/zte/toolsdk/widget/w;

    .line 175
    .line 176
    invoke-direct {p1}, Lcom/zte/toolsdk/widget/w;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-direct {v2, p0, p2, v5, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->insertNewView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Runnable;)Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    return-object p0

    .line 184
    :cond_5
    :goto_0
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0
.end method

.method public mergeBehavior()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public prefersAsyncApply()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->prefersAsyncApply()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->z(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitUris(Ljava/util/function/Consumer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mIndex:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mStableId:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->mNestedViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
