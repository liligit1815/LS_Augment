.class Lcom/zte/mifavor/widget/AlertController$a;
.super Ljava/lang/Object;
.source "AlertController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/AlertController;
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
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 4
    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->c(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/zte/mifavor/widget/AlertController;->c(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 25
    .line 26
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 27
    .line 28
    if-ne p1, v1, :cond_1

    .line 29
    .line 30
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->a(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/zte/mifavor/widget/AlertController;->a(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 50
    .line 51
    if-ne p1, v1, :cond_2

    .line 52
    .line 53
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->b(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/zte/mifavor/widget/AlertController;->b(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    const/4 p1, 0x0

    .line 71
    :goto_0
    if-eqz p1, :cond_3

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 74
    .line 75
    .line 76
    :cond_3
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/zte/mifavor/widget/AlertController;->f(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Handler;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$a;->g:Lcom/zte/mifavor/widget/AlertController;

    .line 83
    .line 84
    invoke-static {p0}, Lcom/zte/mifavor/widget/AlertController;->e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-virtual {p1, v0, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 94
    .line 95
    .line 96
    return-void
.end method
