.class Landroidx/appcompat/app/AlertController$b$c;
.super Ljava/lang/Object;
.source "AlertController.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/app/AlertController$b;->b(Landroidx/appcompat/app/AlertController;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/app/AlertController;

.field final synthetic h:Landroidx/appcompat/app/AlertController$b;


# direct methods
.method constructor <init>(Landroidx/appcompat/app/AlertController$b;Landroidx/appcompat/app/AlertController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/AlertController$b$c;->h:Landroidx/appcompat/app/AlertController$b;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/appcompat/app/AlertController$b$c;->g:Landroidx/appcompat/app/AlertController;

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
    iget-object p1, p0, Landroidx/appcompat/app/AlertController$b$c;->h:Landroidx/appcompat/app/AlertController$b;

    .line 2
    .line 3
    iget-object p1, p1, Landroidx/appcompat/app/AlertController$b;->x:Landroid/content/DialogInterface$OnClickListener;

    .line 4
    .line 5
    iget-object p2, p0, Landroidx/appcompat/app/AlertController$b$c;->g:Landroidx/appcompat/app/AlertController;

    .line 6
    .line 7
    iget-object p2, p2, Landroidx/appcompat/app/AlertController;->b:Landroidx/appcompat/app/j;

    .line 8
    .line 9
    invoke-interface {p1, p2, p3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Landroidx/appcompat/app/AlertController$b$c;->h:Landroidx/appcompat/app/AlertController$b;

    .line 13
    .line 14
    iget-boolean p1, p1, Landroidx/appcompat/app/AlertController$b;->H:Z

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Landroidx/appcompat/app/AlertController$b$c;->g:Landroidx/appcompat/app/AlertController;

    .line 19
    .line 20
    iget-object p0, p0, Landroidx/appcompat/app/AlertController;->b:Landroidx/appcompat/app/j;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/appcompat/app/j;->dismiss()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
