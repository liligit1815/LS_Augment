.class public final Lcom/android/launcher3/widget/picker/e0;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WidgetsRowViewHolder.java"


# instance fields
.field public final a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lz1/Z4;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field c:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Landroid/util/Pair<",
            "Lz1/Z4;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/e0;->b:Ljava/util/Map;

    .line 10
    .line 11
    const v0, 0x7f0b06a5

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 21
    .line 22
    return-void
.end method
