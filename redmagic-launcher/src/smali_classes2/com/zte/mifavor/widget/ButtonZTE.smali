.class public Lcom/zte/mifavor/widget/ButtonZTE;
.super Landroid/widget/Button;
.source "ButtonZTE.java"


# instance fields
.field private g:Lcom/zte/mifavor/widget/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x1010048

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/ButtonZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/ButtonZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p1, Lcom/zte/mifavor/widget/g;

    invoke-direct {p1}, Lcom/zte/mifavor/widget/g;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/ButtonZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 5
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/zte/mifavor/widget/g;->b(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    .line 6
    sget-boolean p1, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public setTextAppearance(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Button;->setTextAppearance(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/ButtonZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->d(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTextFontScale(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ButtonZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
