.class Lcom/android/launcher3/popup/PopupContainerWithArrow$c;
.super Landroid/view/ViewOutlineProvider;
.source "PopupContainerWithArrow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/PopupContainerWithArrow;->Y(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/popup/PopupContainerWithArrow;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$c;->a:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
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
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$c;->a:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 10
    .line 11
    iget v5, p0, Lcom/android/launcher3/popup/c;->mOutlineRadius:F

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    move-object v0, p2

    .line 16
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
