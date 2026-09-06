.class public Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;
.super Landroid/widget/BaseExpandableListAdapter;
.source "RemoteExpandableListAdapter.java"


# instance fields
.field private mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field private mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

.field private mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field private mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseExpandableListAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 11
    .line 12
    return-void
.end method

.method private checkGroupPosition(I)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v0, p0

    .line 8
    int-to-long v2, p1

    .line 9
    const-wide/16 v4, 0x1

    .line 10
    .line 11
    sub-long/2addr v0, v4

    .line 12
    cmp-long p0, v2, v0

    .line 13
    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "Invalid group position: "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method private getView(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {p2, p1}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getViewToReapply(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 16
    .line 17
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v1, p1

    .line 21
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 22
    .line 23
    .line 24
    return-object v3

    .line 25
    :catch_0
    :cond_0
    move-object v1, p1

    .line 26
    :catch_1
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget-object v7, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    iget-object v9, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 34
    .line 35
    move-object v6, p3

    .line 36
    move-object v4, v1

    .line 37
    invoke-virtual/range {v4 .. v9}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method private static getViewToReapply(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews;)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const v1, 0x1020018

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Ljava/lang/Integer;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne p1, v1, :cond_2

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    return-object v0
.end method


# virtual methods
.method public getChild(II)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 8

    .line 2
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->checkGroupPosition(I)V

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    move-result-wide v0

    .line 4
    :goto_0
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-virtual {v2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    move-result-wide v2

    int-to-long v4, p2

    sub-long/2addr v2, v0

    const-wide/16 v6, 0x1

    sub-long/2addr v2, v6

    cmp-long p1, v4, v2

    if-gtz p1, :cond_1

    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    long-to-int p1, v0

    add-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid child position: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic getChild(II)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getChild(II)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public getChildId(II)J
    .locals 0

    .line 1
    int-to-long p0, p2

    .line 2
    return-wide p0
.end method

.method public getChildView(IIZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getChild(II)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1, p4, p5}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getView(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getChildrenCount(I)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->checkGroupPosition(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 10
    .line 11
    add-int/lit8 v1, p1, -0x1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    :goto_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    sub-long/2addr p0, v0

    .line 24
    long-to-int p0, p0

    .line 25
    return p0
.end method

.method public getGroup(I)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getGroup(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getGroup(I)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public getGroupCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getGroupId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1, p3, p4}, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->getView(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public hasStableIds()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->hasStableIds()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isChildSelectable(II)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method setData(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mGroupItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mChildItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteExpandableListAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/BaseExpandableListAdapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
