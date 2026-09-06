.class Lcom/zte/mifavor/widget/TimePickerZTE$d;
.super Ljava/lang/Object;
.source "TimePickerZTE.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/TimePickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/TimePickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$d;->g:Lcom/zte/mifavor/widget/TimePickerZTE;

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
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$d;->g:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->a(Lcom/zte/mifavor/widget/TimePickerZTE;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    xor-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->b(Lcom/zte/mifavor/widget/TimePickerZTE;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$d;->g:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->d(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE$d;->g:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->c(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
