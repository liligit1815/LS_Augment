.class Lcom/zte/mifavor/widget/AlertController$f$b;
.super Landroid/widget/CursorAdapter;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/AlertController$f;->b(Lcom/zte/mifavor/widget/AlertController;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final g:I

.field private final h:I

.field final synthetic i:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

.field final synthetic j:Lcom/zte/mifavor/widget/AlertController;

.field final synthetic k:Lcom/zte/mifavor/widget/AlertController$f;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/AlertController$f;Landroid/content/Context;Landroid/database/Cursor;ZLcom/zte/mifavor/widget/AlertController$RecycleListView;Lcom/zte/mifavor/widget/AlertController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->k:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p5, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->i:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 4
    .line 5
    iput-object p6, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->j:Lcom/zte/mifavor/widget/AlertController;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget-object p3, p1, Lcom/zte/mifavor/widget/AlertController$f;->L:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    iput p3, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->g:I

    .line 21
    .line 22
    iget-object p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->M:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p2, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->h:I

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    .line 1
    const p2, 0x1020014

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/widget/CheckedTextView;

    .line 9
    .line 10
    iget p2, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->g:I

    .line 11
    .line 12
    invoke-interface {p3, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->i:Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 20
    .line 21
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->h:I

    .line 26
    .line 27
    invoke-interface {p3, p0}, Landroid/database/Cursor;->getInt(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 p3, 0x1

    .line 32
    if-ne p0, p3, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p3, 0x0

    .line 36
    :goto_0
    invoke-virtual {p1, p2, p3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->k:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/zte/mifavor/widget/AlertController$f;->b:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$f$b;->j:Lcom/zte/mifavor/widget/AlertController;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/zte/mifavor/widget/AlertController;->j(Lcom/zte/mifavor/widget/AlertController;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p0, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
