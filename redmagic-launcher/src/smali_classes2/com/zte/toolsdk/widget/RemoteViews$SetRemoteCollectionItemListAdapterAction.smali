.class Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetRemoteCollectionItemListAdapterAction"
.end annotation


# instance fields
.field mIntentId:I

.field mIsReplacedIntoAction:Z

.field private mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field final mServiceIntent:Landroid/content/Intent;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/Intent;)V
    .locals 1

    .line 8
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 11
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 12
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 13
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v1, -0x1

    .line 2
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 4
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 5
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 6
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 7
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 2

    .line 14
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v1, -0x1

    .line 15
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 17
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 18
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 19
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 20
    sget-object v1, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v1}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p1

    invoke-direct {v0, p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    :goto_0
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 3
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
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->r(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->getItemsForId(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :cond_2
    :goto_0
    instance-of p2, p2, Landroid/appwidget/AppWidgetHostView;

    .line 42
    .line 43
    const-string v1, ")"

    .line 44
    .line 45
    const-string v2, "RemoteViews"

    .line 46
    .line 47
    if-nez p2, :cond_3

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string p2, "setRemoteAdapter can only be used for AppWidgets (root id: "

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    instance-of p2, p1, Landroid/widget/AdapterView;

    .line 76
    .line 77
    if-nez p2, :cond_4

    .line 78
    .line 79
    new-instance p1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string p2, "Cannot call setRemoteAdapter on a view which is not an AdapterView (id: "

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    check-cast p1, Landroid/widget/AdapterView;

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    instance-of p2, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;

    .line 112
    .line 113
    if-eqz p2, :cond_5

    .line 114
    .line 115
    invoke-interface {p0}, Landroid/widget/Adapter;->getViewTypeCount()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getViewTypeCount()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-lt p2, v1, :cond_5

    .line 124
    .line 125
    :try_start_0
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;

    .line 126
    .line 127
    iget-object p1, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 128
    .line 129
    iget-object p2, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 130
    .line 131
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->setData(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :catchall_0
    move-exception p0

    .line 136
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 137
    .line 138
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 139
    .line 140
    .line 141
    throw p1

    .line 142
    :cond_5
    :try_start_1
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;

    .line 143
    .line 144
    iget-object p2, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 145
    .line 146
    iget-object p3, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 147
    .line 148
    invoke-direct {p0, v0, p2, p3}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, p0}, Landroid/widget/AdapterView;->setAdapter(Landroid/widget/Adapter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :catchall_1
    move-exception p0

    .line 156
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 157
    .line 158
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    throw p1
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x1f

    .line 2
    .line 3
    return p0
.end method

.method public getUniqueKey()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "33_"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->r(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 21
    .line 22
    invoke-virtual {v0, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->setHierarchyDataForId(ILcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    :cond_1
    :goto_0
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
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Landroid/os/Parcel;IZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
