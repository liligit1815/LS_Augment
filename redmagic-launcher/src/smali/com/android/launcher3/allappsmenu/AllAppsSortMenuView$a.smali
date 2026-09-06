.class Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$a;
.super Landroid/view/ViewOutlineProvider;
.source "AllAppsSortMenuView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$a;->a:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

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
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$a;->a:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x0

    .line 21
    move-object v0, p2

    .line 22
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
