.class LX3/a$c;
.super Landroidx/recyclerview/widget/GridLayoutManager$d;
.source "AdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LX3/a;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager$d;


# direct methods
.method constructor <init>(LX3/a;Landroidx/recyclerview/widget/GridLayoutManager$d;)V
    .locals 0

    .line 1
    iput-object p2, p0, LX3/a$c;->a:Landroidx/recyclerview/widget/GridLayoutManager$d;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$d;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 0

    .line 1
    iget-object p0, p0, LX3/a$c;->a:Landroidx/recyclerview/widget/GridLayoutManager$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager$d;->getSpanSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method
