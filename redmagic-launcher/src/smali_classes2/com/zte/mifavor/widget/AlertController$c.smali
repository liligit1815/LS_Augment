.class Lcom/zte/mifavor/widget/AlertController$c;
.super Ljava/lang/Object;
.source "AlertController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/AlertController;->f0(Landroid/widget/LinearLayout;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/AlertController;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/AlertController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/AlertController;->f(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$c;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/zte/mifavor/widget/AlertController;->e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
