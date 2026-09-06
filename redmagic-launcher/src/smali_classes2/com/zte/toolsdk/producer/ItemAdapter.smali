.class public abstract Lcom/zte/toolsdk/producer/ItemAdapter;
.super Ljava/lang/Object;
.source "ItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
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
.method public abstract bindData(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "TT;)V"
        }
    .end annotation
.end method

.method public abstract bindListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
.end method

.method public abstract getLayoutId()I
.end method
