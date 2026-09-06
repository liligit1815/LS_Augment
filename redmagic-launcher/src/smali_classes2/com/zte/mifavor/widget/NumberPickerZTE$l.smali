.class Lcom/zte/mifavor/widget/NumberPickerZTE$l;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "l"
.end annotation


# instance fields
.field private final g:Landroid/widget/EditText;

.field private h:I

.field private i:I

.field private j:Z


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->j:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->h:I

    .line 2
    .line 3
    iput p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->i:I

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->j:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->j:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->j:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->h:I

    .line 11
    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->i:I

    .line 21
    .line 22
    if-lt v0, v1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->g:Landroid/widget/EditText;

    .line 25
    .line 26
    iget p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->h:I

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Landroid/widget/EditText;->setSelection(II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
