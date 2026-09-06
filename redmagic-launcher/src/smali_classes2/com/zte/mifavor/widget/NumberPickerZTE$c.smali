.class Lcom/zte/mifavor/widget/NumberPickerZTE$c;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$c;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$c;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, v0, v0}, Landroid/widget/EditText;->setSelection(II)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$c;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->y(Lcom/zte/mifavor/widget/NumberPickerZTE;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
