.class Lcom/zte/mifavor/widget/NumberPickerZTE$a;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/NumberPickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NumberPickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$a;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

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
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$a;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->u(Lcom/zte/mifavor/widget/NumberPickerZTE;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$a;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sget v0, LR3/g;->F:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$a;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-static {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$a;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
