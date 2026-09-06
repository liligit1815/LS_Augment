.class Lcom/zte/mifavor/widget/AlertController$f$c;
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
.field final synthetic g:Lcom/zte/mifavor/widget/AlertController;

.field final synthetic h:Lcom/zte/mifavor/widget/AlertController$f;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/AlertController$f;Lcom/zte/mifavor/widget/AlertController;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->h:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->h:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->x:Landroid/content/DialogInterface$OnClickListener;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/zte/mifavor/widget/AlertController;->e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p1, p2, p3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->h:Lcom/zte/mifavor/widget/AlertController$f;

    .line 15
    .line 16
    iget-boolean p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$f$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/zte/mifavor/widget/AlertController;->e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
