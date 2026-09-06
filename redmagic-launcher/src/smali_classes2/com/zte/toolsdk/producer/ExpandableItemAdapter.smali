.class public abstract Lcom/zte/toolsdk/producer/ExpandableItemAdapter;
.super Ljava/lang/Object;
.source "ExpandableItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract bindChild(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "TU;)V"
        }
    .end annotation
.end method

.method public abstract bindGroup(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "TT;)V"
        }
    .end annotation
.end method

.method public abstract bindListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V
.end method

.method public abstract getChildLayoutId()I
.end method

.method public abstract getGroupLayoutId()I
.end method
