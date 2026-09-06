.class public final synthetic Lcom/zte/toolsdk/widget/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;


# direct methods
.method public synthetic constructor <init>(ILandroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/zte/toolsdk/widget/k;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/k;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/zte/toolsdk/widget/k;->c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/k;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/k;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/k;->c:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 6
    .line 7
    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->a(ILandroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
