.class public Lcom/zte/mifavor/widget/AlertController$RecycleListView;
.super Lcom/zte/mifavor/widget/ListView;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/AlertController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecycleListView"
.end annotation


# instance fields
.field q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/AlertController;->p()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/AlertController$RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/AlertController$RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zte/mifavor/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController$RecycleListView;->q:Z

    return-void
.end method


# virtual methods
.method protected recycleOnMeasure()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/AlertController$RecycleListView;->q:Z

    .line 2
    .line 3
    return p0
.end method
