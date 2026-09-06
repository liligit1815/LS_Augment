.class final Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RunnableAction"
.end annotation


# instance fields
.field private final mRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;->mRunnable:Ljava/lang/Runnable;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;->mRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
