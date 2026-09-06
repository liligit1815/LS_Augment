.class public Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RemoteResponse"
.end annotation


# static fields
.field public static final INTERACTION_TYPE_CHECKED_CHANGE:I = 0x1

.field public static final INTERACTION_TYPE_CLICK:I


# instance fields
.field private mElementNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFillIntent:Landroid/content/Intent;

.field private mInteractionType:I

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private mViewIds:Landroid/util/IntArray;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mInteractionType:I

    .line 6
    .line 7
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->handleViewInteraction(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->readFromParcel(Landroid/os/Parcel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Landroid/app/PendingIntent;Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntentTemplateAndFillInIntent(Landroid/app/PendingIntent;Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static fromFillInIntent(Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 7
    .line 8
    return-object v0
.end method

.method public static fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 7
    .line 8
    return-object v0
.end method

.method private static fromPendingIntentTemplateAndFillInIntent(Landroid/app/PendingIntent;Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 7
    .line 8
    iput-object p1, v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 9
    .line 10
    return-object v0
.end method

.method static bridge synthetic g(Landroid/view/View;)Landroid/widget/AdapterView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->getAdapterViewAncestor(Landroid/view/View;)Landroid/widget/AdapterView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static getAdapterViewAncestor(Landroid/view/View;)Landroid/widget/AdapterView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Landroid/widget/AdapterView<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/View;

    .line 10
    .line 11
    :goto_0
    if-eqz p0, :cond_2

    .line 12
    .line 13
    instance-of v1, p0, Landroid/widget/AdapterView;

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    instance-of v1, p0, Landroid/appwidget/AppWidgetHostView;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    instance-of v1, p0, Landroid/appwidget/AppWidgetHostView$AdapterChildHostView;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Landroid/view/View;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    instance-of v1, p0, Landroid/widget/AdapterView;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    check-cast p0, Landroid/widget/AdapterView;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_3
    return-object v0
.end method

.method private handleViewInteraction(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 7
    .line 8
    const-string v1, "RemoteViews"

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->getAdapterViewAncestor(Landroid/view/View;)Landroid/widget/AdapterView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string p0, "Collection item doesn\'t have AdapterView parent"

    .line 19
    .line 20
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    instance-of v2, v2, Landroid/app/PendingIntent;

    .line 29
    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    const-string p0, "Attempting setOnClickFillInIntent or setOnCheckedChangeFillInIntent without calling setPendingIntentTemplate on parent."

    .line 33
    .line 34
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/app/PendingIntent;

    .line 43
    .line 44
    :goto_0
    invoke-interface {p2, p1, v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;->onInteraction(Landroid/view/View;Landroid/app/PendingIntent;Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    const-string p0, "Response has neither pendingIntent nor fillInIntent"

    .line 49
    .line 50
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private readFromParcel(Landroid/os/Parcel;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/app/PendingIntent;->readPendingIntentOrNullFromParcel(Landroid/os/Parcel;)Landroid/app/PendingIntent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readBoolean()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/content/Intent;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v0, v1

    .line 24
    :goto_0
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mInteractionType:I

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-static {v0}, Landroid/util/IntArray;->wrap([I)Landroid/util/IntArray;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_1
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 50
    .line 51
    return-void
.end method

.method private writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/app/PendingIntent;->writePendingIntentOrNullToParcel(Landroid/app/PendingIntent;Landroid/os/Parcel;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mInteractionType:I

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 29
    .line 30
    if-nez p2, :cond_2

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    invoke-virtual {p2}, Landroid/util/IntArray;->toArray()[I

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    :goto_1
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public addSharedElement(ILjava/lang/String;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/IntArray;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/IntArray;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/util/IntArray;->add(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public getLaunchOptions(Landroid/view/View;)Landroid/util/Pair;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/content/Intent;",
            "Landroid/app/ActivityOptions;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    iget-object v0, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 12
    .line 13
    .line 14
    :goto_0
    move-object v3, v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 17
    .line 18
    iget-object v3, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mFillIntent:Landroid/content/Intent;

    .line 19
    .line 20
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :goto_1
    invoke-static {v2}, Lcom/zte/toolsdk/widget/RemoteViews;->getSourceBounds(Landroid/view/View;)Landroid/graphics/Rect;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    instance-of v0, v2, Landroid/widget/CompoundButton;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget v0, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mInteractionType:I

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    if-ne v0, v4, :cond_1

    .line 39
    .line 40
    move-object v0, v2

    .line 41
    check-cast v0, Landroid/widget/CompoundButton;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const-string v4, "android.widget.extra.CHECKED"

    .line 48
    .line 49
    invoke-virtual {v3, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const v5, 0x111020d

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const-string v5, "RemoteResponse getLaunchOptions error: "

    .line 68
    .line 69
    const-string v7, "setPendingIntentLaunchFlags"

    .line 70
    .line 71
    const-string v8, "android.app.ActivityOptions"

    .line 72
    .line 73
    const/4 v9, 0x0

    .line 74
    const-string v10, "RemoteViews"

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget-object v11, Lcom/android/internal/R$styleable;->Window:[I

    .line 83
    .line 84
    invoke-virtual {v0, v11}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    const/16 v0, 0x8

    .line 89
    .line 90
    const/4 v12, 0x0

    .line 91
    invoke-virtual {v11, v0, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 92
    .line 93
    .line 94
    move-result v13

    .line 95
    new-array v14, v12, [I

    .line 96
    .line 97
    :try_start_0
    const-string v0, "com.android.internal.R$styleable"

    .line 98
    .line 99
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v15, "WindowAnimation"

    .line 104
    .line 105
    invoke-virtual {v0, v15}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, [I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    move-object v14, v0

    .line 116
    const/high16 v16, 0x10000000

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :catch_0
    move-exception v0

    .line 120
    new-instance v15, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const/high16 v16, 0x10000000

    .line 126
    .line 127
    const-string v6, "get r styleable WindowAnimation error: "

    .line 128
    .line 129
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :goto_2
    invoke-virtual {v4, v13, v14}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const/16 v6, 0x1a

    .line 151
    .line 152
    invoke-virtual {v0, v6, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 160
    .line 161
    .line 162
    if-eqz v6, :cond_3

    .line 163
    .line 164
    :try_start_1
    invoke-static {v4, v6, v12}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 165
    .line 166
    .line 167
    move-result-object v9

    .line 168
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 173
    .line 174
    filled-new-array {v4}, [Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v0, v7, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-virtual {v0, v9, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 191
    .line 192
    .line 193
    goto :goto_3

    .line 194
    :catch_1
    move-exception v0

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_2
    const/high16 v16, 0x10000000

    .line 219
    .line 220
    :cond_3
    :goto_3
    if-nez v9, :cond_5

    .line 221
    .line 222
    iget-object v0, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 223
    .line 224
    if-eqz v0, :cond_5

    .line 225
    .line 226
    iget-object v0, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 227
    .line 228
    if-eqz v0, :cond_5

    .line 229
    .line 230
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Landroid/view/View;

    .line 235
    .line 236
    :goto_4
    if-eqz v0, :cond_4

    .line 237
    .line 238
    instance-of v4, v0, Landroid/appwidget/AppWidgetHostView;

    .line 239
    .line 240
    if-nez v4, :cond_4

    .line 241
    .line 242
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Landroid/view/View;

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_4
    instance-of v4, v0, Landroid/appwidget/AppWidgetHostView;

    .line 250
    .line 251
    if-eqz v4, :cond_5

    .line 252
    .line 253
    :try_start_2
    const-string v4, "android.appwidget.AppWidgetHostView"

    .line 254
    .line 255
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    const-string v6, "createSharedElementActivityOptions"

    .line 260
    .line 261
    const-class v11, [Ljava/lang/Object;

    .line 262
    .line 263
    const-class v12, [Ljava/lang/String;

    .line 264
    .line 265
    const-class v13, Landroid/content/Intent;

    .line 266
    .line 267
    filled-new-array {v11, v12, v13}, [Ljava/lang/Class;

    .line 268
    .line 269
    .line 270
    move-result-object v11

    .line 271
    invoke-virtual {v4, v6, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    iget-object v6, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mViewIds:Landroid/util/IntArray;

    .line 276
    .line 277
    invoke-virtual {v6}, Landroid/util/IntArray;->toArray()[I

    .line 278
    .line 279
    .line 280
    move-result-object v6

    .line 281
    iget-object v1, v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mElementNames:Ljava/util/ArrayList;

    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 284
    .line 285
    .line 286
    move-result v11

    .line 287
    new-array v11, v11, [Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    filled-new-array {v6, v1, v3}, [Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-virtual {v4, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    check-cast v0, Landroid/app/ActivityOptions;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 302
    .line 303
    move-object v9, v0

    .line 304
    goto :goto_5

    .line 305
    :catch_2
    move-exception v0

    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 309
    .line 310
    .line 311
    const-string v4, "createSharedElementActivityOptions error: "

    .line 312
    .line 313
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    :cond_5
    :goto_5
    if-nez v9, :cond_6

    .line 331
    .line 332
    :try_start_3
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 333
    .line 334
    .line 335
    move-result-object v9

    .line 336
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 341
    .line 342
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    invoke-virtual {v0, v9, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 359
    .line 360
    .line 361
    goto :goto_6

    .line 362
    :catch_3
    move-exception v0

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    :cond_6
    :goto_6
    invoke-virtual {v2}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    if-eqz v0, :cond_7

    .line 390
    .line 391
    invoke-virtual {v2}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    invoke-virtual {v9, v0}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 400
    .line 401
    .line 402
    goto :goto_7

    .line 403
    :cond_7
    new-instance v0, Ljava/lang/Exception;

    .line 404
    .line 405
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 406
    .line 407
    .line 408
    const-string v1, "getLaunchOptions: view.getDisplay() is null!"

    .line 409
    .line 410
    invoke-static {v10, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 411
    .line 412
    .line 413
    :goto_7
    const/4 v0, 0x3

    .line 414
    invoke-virtual {v9, v0}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 415
    .line 416
    .line 417
    invoke-static {v3, v9}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    return-object v0
.end method

.method public setInteractionType(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->mInteractionType:I

    .line 2
    .line 3
    return-object p0
.end method
