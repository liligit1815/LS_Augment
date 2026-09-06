.class Landroidx/fragment/app/ListFragment$b;
.super Ljava/lang/Object;
.source "ListFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/ListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/fragment/app/ListFragment;


# direct methods
.method constructor <init>(Landroidx/fragment/app/ListFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/ListFragment$b;->g:Landroidx/fragment/app/ListFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/ListFragment$b;->g:Landroidx/fragment/app/ListFragment;

    .line 2
    .line 3
    check-cast p1, Landroid/widget/ListView;

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Landroidx/fragment/app/ListFragment;->n(Landroid/widget/ListView;Landroid/view/View;IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
