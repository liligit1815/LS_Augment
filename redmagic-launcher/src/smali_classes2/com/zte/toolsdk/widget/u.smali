.class public final synthetic Lcom/zte/toolsdk/widget/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;


# direct methods
.method public synthetic constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/u;->a:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/u;->a:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 2
    .line 3
    check-cast p1, Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
