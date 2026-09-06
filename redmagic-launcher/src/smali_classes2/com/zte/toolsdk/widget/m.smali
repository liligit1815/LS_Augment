.class public final synthetic Lcom/zte/toolsdk/widget/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;

.field public final synthetic b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;


# direct methods
.method public synthetic constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/m;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/m;->b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/m;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/m;->b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->a(Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/widget/CompoundButton;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
