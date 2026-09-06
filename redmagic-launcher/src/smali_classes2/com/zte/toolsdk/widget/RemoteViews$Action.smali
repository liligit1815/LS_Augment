.class abstract Lcom/zte/toolsdk/widget/RemoteViews$Action;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Action"
.end annotation


# static fields
.field public static final MERGE_APPEND:I = 0x1

.field public static final MERGE_IGNORE:I = 0x2

.field public static final MERGE_REPLACE:I


# instance fields
.field mViewId:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/zte/toolsdk/widget/z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getActionTag()I
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
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getActionTag()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "_"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 0

    .line 1
    return-object p0
.end method

.method public mergeBehavior()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public prefersAsyncApply()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 0

    .line 1
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
    return-void
.end method

.method public abstract writeToParcel(Landroid/os/Parcel;I)V
.end method
