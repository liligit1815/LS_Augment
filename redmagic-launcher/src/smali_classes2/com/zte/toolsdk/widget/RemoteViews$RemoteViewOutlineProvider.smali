.class public final Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewOutlineProvider;
.super Landroid/view/ViewOutlineProvider;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemoteViewOutlineProvider"
.end annotation


# instance fields
.field private final mRadius:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewOutlineProvider;->mRadius:F

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    iget v5, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewOutlineProvider;->mRadius:F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    move-object v0, p2

    .line 14
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewOutlineProvider;->mRadius:F

    .line 2
    .line 3
    return p0
.end method
