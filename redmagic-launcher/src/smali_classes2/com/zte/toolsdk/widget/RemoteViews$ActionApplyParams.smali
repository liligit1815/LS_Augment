.class public Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ActionApplyParams"
.end annotation


# instance fields
.field public applyThemeResId:I

.field public colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

.field public executor:Ljava/util/concurrent/Executor;

.field public handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method public constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clone()Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
    .locals 2

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v0

    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 3
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v0

    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->executor:Ljava/util/concurrent/Executor;

    .line 4
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withExecutor(Ljava/util/concurrent/Executor;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v0

    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->applyThemeResId:I

    .line 5
    invoke-virtual {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withThemeResId(I)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->clone()Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p0

    return-object p0
.end method

.method public withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 2
    .line 3
    return-object p0
.end method

.method public withExecutor(Ljava/util/concurrent/Executor;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public withThemeResId(I)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->applyThemeResId:I

    .line 2
    .line 3
    return-object p0
.end method
