.class public Lp2/g;
.super Ljava/lang/Object;
.source "WidgetsSearchBarController.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements LI1/b;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/text/TextWatcher;",
        "LI1/b<",
        "Lm2/g;",
        ">;",
        "Landroid/view/View$OnKeyListener;"
    }
.end annotation


# instance fields
.field protected g:LI1/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI1/a<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field protected h:Lcom/android/launcher3/ExtendedEditText;

.field protected i:Landroid/widget/ImageButton;

.field protected j:Lp2/a;

.field protected k:Ljava/lang/String;


# direct methods
.method public constructor <init>(LI1/a;Lcom/android/launcher3/ExtendedEditText;Landroid/widget/ImageButton;Lp2/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI1/a<",
            "Lm2/g;",
            ">;",
            "Lcom/android/launcher3/ExtendedEditText;",
            "Landroid/widget/ImageButton;",
            "Lp2/a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp2/g;->g:LI1/a;

    .line 5
    .line 6
    iput-object p2, p0, Lp2/g;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lp2/g;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lp2/g;->i:Landroid/widget/ImageButton;

    .line 17
    .line 18
    new-instance p1, Lp2/f;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lp2/f;-><init>(Lp2/g;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p3, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iput-object p4, p0, Lp2/g;->j:Lp2/a;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lp2/g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lp2/g;->e(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lp2/g;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lp2/g;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lp2/g;->g:LI1/a;

    .line 15
    .line 16
    invoke-interface {p1, v0}, LI1/a;->cancel(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lp2/g;->j:Lp2/a;

    .line 20
    .line 21
    invoke-interface {p1}, Lp2/a;->u()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lp2/g;->i:Landroid/widget/ImageButton;

    .line 25
    .line 26
    const/16 p1, 0x8

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Lp2/g;->g:LI1/a;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-interface {p1, v1}, LI1/a;->cancel(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lp2/g;->j:Lp2/a;

    .line 39
    .line 40
    invoke-interface {p1, v0}, Lp2/a;->E(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lp2/g;->g:LI1/a;

    .line 44
    .line 45
    iget-object v0, p0, Lp2/g;->k:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, v0, p0}, LI1/a;->a(Ljava/lang/String;LI1/b;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lp2/g;->i:Landroid/widget/ImageButton;

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lp2/g;->j:Lp2/a;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Lp2/a;->n(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lp2/g;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lp2/g;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lp2/g;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lp2/g;->g:LI1/a;

    .line 2
    .line 3
    invoke-interface {p0}, LI1/a;->destroy()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/16 p1, 0x42

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 p2, 0x1

    .line 10
    if-ne p1, p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lp2/g;->c()V

    .line 13
    .line 14
    .line 15
    return p2

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
