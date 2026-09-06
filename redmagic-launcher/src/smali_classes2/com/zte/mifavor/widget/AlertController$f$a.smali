.class Lcom/zte/mifavor/widget/AlertController$f$a;
.super Lcom/zte/mifavor/widget/AlertController$h;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/AlertController$f;->b(Lcom/zte/mifavor/widget/AlertController;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

.field final synthetic h:Lcom/zte/mifavor/widget/AlertController$f;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/AlertController$f;Landroid/content/Context;II[Ljava/lang/CharSequence;Lcom/zte/mifavor/widget/AlertController$RecycleListView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$a;->h:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p6, p0, Lcom/zte/mifavor/widget/AlertController$f$a;->g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/zte/mifavor/widget/AlertController$h;-><init>(Landroid/content/Context;II[Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/AlertController$h;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p3, p0, Lcom/zte/mifavor/widget/AlertController$f$a;->h:Lcom/zte/mifavor/widget/AlertController$f;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/zte/mifavor/widget/AlertController$f;->F:[Z

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    aget-boolean p3, p3, p1

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$f$a;->g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 16
    .line 17
    const/4 p3, 0x1

    .line 18
    invoke-virtual {p0, p1, p3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object p2
.end method
