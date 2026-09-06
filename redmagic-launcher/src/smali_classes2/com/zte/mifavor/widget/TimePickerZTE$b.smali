.class Lcom/zte/mifavor/widget/TimePickerZTE$b;
.super Ljava/lang/Object;
.source "TimePickerZTE.java"

# interfaces
.implements Lcom/zte/mifavor/widget/NumberPickerZTE$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/TimePickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/TimePickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->e(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->g()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    const/16 p1, 0xc

    .line 15
    .line 16
    const/16 v0, 0xb

    .line 17
    .line 18
    if-ne p2, v0, :cond_0

    .line 19
    .line 20
    if-eq p3, p1, :cond_1

    .line 21
    .line 22
    :cond_0
    if-ne p2, p1, :cond_2

    .line 23
    .line 24
    if-ne p3, v0, :cond_2

    .line 25
    .line 26
    :cond_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->a(Lcom/zte/mifavor/widget/TimePickerZTE;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    xor-int/lit8 p2, p2, 0x1

    .line 33
    .line 34
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/TimePickerZTE;->b(Lcom/zte/mifavor/widget/TimePickerZTE;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->d(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE$b;->a:Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->c(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
