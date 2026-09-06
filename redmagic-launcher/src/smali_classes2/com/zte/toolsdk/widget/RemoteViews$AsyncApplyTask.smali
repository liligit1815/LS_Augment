.class Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;
.super Landroid/os/AsyncTask;
.source "RemoteViews.java"

# interfaces
.implements Landroid/os/CancellationSignal$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AsyncApplyTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;",
        ">;",
        "Landroid/os/CancellationSignal$OnCancelListener;"
    }
.end annotation


# instance fields
.field private mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

.field final mApplyParams:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

.field final mCancelSignal:Landroid/os/CancellationSignal;

.field final mContext:Landroid/content/Context;

.field private mError:Ljava/lang/Exception;

.field final mListener:Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;

.field final mParent:Landroid/view/ViewGroup;

.field final mRV:Lcom/zte/toolsdk/widget/RemoteViews;

.field private mResult:Landroid/view/View;

.field final mTopLevel:Z

.field private mTree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method private constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;Z)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 3
    new-instance p1, Landroid/os/CancellationSignal;

    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mCancelSignal:Landroid/os/CancellationSignal;

    .line 4
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mRV:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mParent:Landroid/view/ViewGroup;

    .line 6
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mContext:Landroid/content/Context;

    .line 7
    iput-object p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mListener:Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;

    .line 8
    iput-boolean p8, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mTopLevel:Z

    .line 9
    iput-object p6, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mApplyParams:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 10
    iput-object p7, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    return-void
.end method

.method synthetic constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;ZLcom/zte/toolsdk/widget/z;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;Z)V

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Ljava/lang/Exception;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Ljava/util/concurrent/Executor;)Landroid/os/CancellationSignal;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->startTaskOnExecutor(Ljava/util/concurrent/Executor;)Landroid/os/CancellationSignal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private startTaskOnExecutor(Ljava/util/concurrent/Executor;)Landroid/os/CancellationSignal;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mCancelSignal:Landroid/os/CancellationSignal;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    new-array v0, v0, [Ljava/lang/Void;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mCancelSignal:Landroid/os/CancellationSignal;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;
    .locals 7

    const/4 p1, 0x0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    if-nez v0, :cond_0

    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mRV:Lcom/zte/toolsdk/widget/RemoteViews;

    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mParent:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mApplyParams:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    iget-object v6, v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    const/4 v5, 0x0

    invoke-static/range {v1 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->I(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;ILcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_2

    .line 4
    :cond_0
    :goto_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    invoke-direct {v0, v1, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;-><init>(Landroid/view/View;Lcom/zte/toolsdk/widget/z;)V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mTree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 5
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mRV:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 6
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mRV:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 7
    new-array v1, v0, [Lcom/zte/toolsdk/widget/RemoteViews$Action;

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_2

    .line 8
    invoke-virtual {p0}, Landroid/os/AsyncTask;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_2

    .line 9
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mRV:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mTree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    iget-object v5, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mParent:Landroid/view/ViewGroup;

    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mApplyParams:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-virtual {v3, v4, v5, v6}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 10
    :cond_1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 11
    :cond_2
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mTree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 12
    :goto_2
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->doInBackground([Ljava/lang/Void;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    move-result-object p0

    return-object p0
.end method

.method public onCancel()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected onPostExecute(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V
    .locals 7

    .line 2
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mCancelSignal:Landroid/os/CancellationSignal;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 3
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    if-nez v0, :cond_3

    .line 4
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mListener:Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;

    if-eqz v0, :cond_0

    .line 5
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;->onViewInflated(Landroid/view/View;)V

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

    if-eqz v0, :cond_2

    .line 7
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mApplyParams:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->clone()Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v0

    .line 8
    iget-object v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    if-nez v1, :cond_1

    .line 9
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->N()Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    move-result-object v1

    iput-object v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_2

    .line 10
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mActions:[Lcom/zte/toolsdk/widget/RemoteViews$Action;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 11
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mParent:Landroid/view/ViewGroup;

    invoke-virtual {v4, v5, v6, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 12
    :cond_2
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mTopLevel:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mResult:Landroid/view/View;

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 13
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->A(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 14
    :goto_2
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    .line 15
    :cond_3
    :goto_3
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mListener:Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;

    if-eqz v0, :cond_5

    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    if-eqz p0, :cond_4

    .line 17
    invoke-interface {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;->onError(Ljava/lang/Exception;)V

    goto :goto_4

    .line 18
    :cond_4
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;->onViewApplied(Landroid/view/View;)V

    goto :goto_4

    .line 19
    :cond_5
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    if-eqz p1, :cond_7

    .line 20
    instance-of v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    if-eqz v0, :cond_6

    .line 21
    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    throw p1

    .line 22
    :cond_6
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->mError:Ljava/lang/Exception;

    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Exception;)V

    throw p1

    :cond_7
    :goto_4
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->onPostExecute(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V

    return-void
.end method
