.class Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetRemoteExpandableListAdapterAction"
.end annotation


# instance fields
.field private mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field private mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field mIsReplacedIntoAction:Z


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mIsReplacedIntoAction:Z

    .line 3
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 4
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 5
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p1

    invoke-virtual {p4, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 6
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 7
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 2

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mIsReplacedIntoAction:Z

    .line 10
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 11
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mIsReplacedIntoAction:Z

    .line 12
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 13
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p1

    invoke-direct {v0, p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_1
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 28
    .line 29
    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_2
    instance-of p2, p2, Landroid/appwidget/AppWidgetHostView;

    .line 37
    .line 38
    const-string v2, ")"

    .line 39
    .line 40
    const-string v3, "RemoteViews"

    .line 41
    .line 42
    if-nez p2, :cond_3

    .line 43
    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string p2, "setRemoteExpandableListAdapter can only be used for AppWidgets (root id: "

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    instance-of p2, p1, Landroid/widget/ExpandableListView;

    .line 71
    .line 72
    if-nez p2, :cond_4

    .line 73
    .line 74
    new-instance p1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string p2, "Cannot call setRemoteExpandableListAdapter on a view which is not an ExpandableListView (id: "

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    check-cast p1, Landroid/widget/ExpandableListView;

    .line 101
    .line 102
    :try_start_0
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;

    .line 103
    .line 104
    iget-object p2, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 105
    .line 106
    iget-object p3, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 107
    .line 108
    invoke-direct {p0, v0, v1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, p0}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :catchall_0
    move-exception p0

    .line 116
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    throw p1
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x25

    .line 2
    .line 3
    return p0
.end method

.method public setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mIsReplacedIntoAction:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {v0, p1, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Landroid/os/Parcel;IZ)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p0, p1, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Landroid/os/Parcel;IZ)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
