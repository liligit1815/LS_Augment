.class Lcom/zte/mifavor/widget/AlertController$f$d;
.super Ljava/lang/Object;
.source "AlertController.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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

.field final synthetic h:Lcom/zte/mifavor/widget/AlertController;

.field final synthetic i:Lcom/zte/mifavor/widget/AlertController$f;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/AlertController$f;Lcom/zte/mifavor/widget/AlertController$RecycleListView;Lcom/zte/mifavor/widget/AlertController;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->i:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->h:Lcom/zte/mifavor/widget/AlertController;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->i:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->F:[Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 8
    .line 9
    invoke-virtual {p2, p3}, Landroid/widget/ListView;->isItemChecked(I)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    aput-boolean p2, p1, p3

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->i:Lcom/zte/mifavor/widget/AlertController$f;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->J:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 18
    .line 19
    iget-object p2, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->h:Lcom/zte/mifavor/widget/AlertController;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/zte/mifavor/widget/AlertController;->e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$f$d;->g:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 26
    .line 27
    invoke-virtual {p0, p3}, Landroid/widget/ListView;->isItemChecked(I)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-interface {p1, p2, p3, p0}, Landroid/content/DialogInterface$OnMultiChoiceClickListener;->onClick(Landroid/content/DialogInterface;IZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
