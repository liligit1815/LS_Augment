.class public final synthetic LG1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lkotlin/jvm/internal/C;

.field public final synthetic c:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic d:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LG1/b;->a:I

    .line 5
    .line 6
    iput-object p2, p0, LG1/b;->b:Lkotlin/jvm/internal/C;

    .line 7
    .line 8
    iput-object p3, p0, LG1/b;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    iput-object p4, p0, LG1/b;->d:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 11
    .line 12
    iput p5, p0, LG1/b;->e:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, LG1/b;->a:I

    .line 2
    .line 3
    iget-object v1, p0, LG1/b;->b:Lkotlin/jvm/internal/C;

    .line 4
    .line 5
    iget-object v2, p0, LG1/b;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    iget-object v3, p0, LG1/b;->d:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 8
    .line 9
    iget p0, p0, LG1/b;->e:I

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, LG1/d;->c(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
