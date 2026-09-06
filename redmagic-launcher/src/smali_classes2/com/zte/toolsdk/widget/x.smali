.class public final synthetic Lcom/zte/toolsdk/widget/x;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
