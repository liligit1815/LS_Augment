.class public final Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions$Builder;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation build Landroid/annotation/FlaggedApi;
    value = "android.appwidget.flags.draw_data_parcel"
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final mInstructions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/FlaggedApi;
        value = "android.appwidget.flags.draw_data_parcel"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions$Builder;->mInstructions:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public build()Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;
    .locals 2
    .annotation build Landroid/annotation/FlaggedApi;
        value = "android.appwidget.flags.draw_data_parcel"
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions$Builder;->mInstructions:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;-><init>(Ljava/util/List;Lcom/zte/toolsdk/widget/z;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
