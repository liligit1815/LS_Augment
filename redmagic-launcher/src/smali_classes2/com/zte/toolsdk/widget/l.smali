.class public final synthetic Lcom/zte/toolsdk/widget/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic a:Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;


# direct methods
.method public synthetic constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/l;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/l;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/zte/toolsdk/widget/l;->c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/l;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/l;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/zte/toolsdk/widget/l;->c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    move-object v4, p2

    .line 9
    move-object v5, p3

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->b(Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
