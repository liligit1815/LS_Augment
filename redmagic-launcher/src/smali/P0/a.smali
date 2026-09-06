.class public LP0/a;
.super Ljava/lang/Object;
.source "AllAppsSearchBarController.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/android/launcher3/ExtendedEditText$a;


# instance fields
.field protected g:Lcom/android/launcher3/views/k;

.field protected h:LI1/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI1/b<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation
.end field

.field protected i:Lcom/android/launcher3/ExtendedEditText;

.field protected j:Ljava/lang/String;

.field private k:[Ljava/lang/String;

.field protected l:LI1/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI1/a<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation
.end field

.field private m:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, LP0/a;->m:Landroid/widget/Button;

    .line 6
    .line 7
    return-void
.end method

.method public static a(Ljava/lang/CharSequence;)[Ljava/lang/String;
    .locals 3

    .line 1
    instance-of v0, p0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const-class v1, Landroid/text/style/SuggestionSpan;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v2, p0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, [Landroid/text/style/SuggestionSpan;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    array-length v1, p0

    .line 24
    if-lez v1, :cond_0

    .line 25
    .line 26
    aget-object v1, p0, v2

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    aget-object p0, p0, v2

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/text/style/SuggestionSpan;->getSuggestions()[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method


# virtual methods
.method public H()Z
    .locals 2

    .line 1
    iget-object v0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, LP0/a;->f()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    return v1
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, LP0/a;->j:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "afterTextChanged, query string: "

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, LP0/a;->j:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "AllAppsSearchBarController"

    .line 27
    .line 28
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, LP0/a;->j:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v0, 0x0

    .line 38
    const/4 v1, 0x1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, LP0/a;->l:LI1/a;

    .line 42
    .line 43
    invoke-interface {p1, v1}, LI1/a;->cancel(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, LP0/a;->h:LI1/b;

    .line 47
    .line 48
    invoke-interface {p1}, LI1/b;->d()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, LP0/a;->m:Landroid/widget/Button;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object p1, p0, LP0/a;->l:LI1/a;

    .line 60
    .line 61
    invoke-interface {p1, v0}, LI1/a;->cancel(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, LP0/a;->l:LI1/a;

    .line 65
    .line 66
    iget-object v0, p0, LP0/a;->j:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v2, p0, LP0/a;->k:[Ljava/lang/String;

    .line 69
    .line 70
    iget-object v3, p0, LP0/a;->h:LI1/b;

    .line 71
    .line 72
    invoke-interface {p1, v0, v2, v3}, LI1/a;->b(Ljava/lang/String;[Ljava/lang/String;LI1/b;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, LP0/a;->m:Landroid/widget/Button;

    .line 76
    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    const/16 v0, 0x8

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget-object p0, p0, LP0/a;->g:Lcom/android/launcher3/views/k;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    instance-of p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 93
    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 97
    .line 98
    .line 99
    :cond_2
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->n()Z

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

.method public final c(LI1/a;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/views/k;LI1/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI1/a<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;",
            "Lcom/android/launcher3/ExtendedEditText;",
            "Lcom/android/launcher3/views/k;",
            "LI1/b<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p4, p0, LP0/a;->h:LI1/b;

    .line 2
    .line 3
    iput-object p3, p0, LP0/a;->g:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    iput-object p2, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/android/launcher3/ExtendedEditText;->setOnBackKeyListener(Lcom/android/launcher3/ExtendedEditText$a;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, LP0/a;->l:LI1/a;

    .line 21
    .line 22
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->isFocused()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, LP0/a;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, LP0/a;->l:LI1/a;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-interface {v0, v1}, LI1/a;->cancel(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LP0/a;->l:LI1/a;

    .line 17
    .line 18
    iget-object v1, p0, LP0/a;->j:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p0, LP0/a;->h:LI1/b;

    .line 21
    .line 22
    invoke-interface {v0, v1, p0}, LI1/a;->a(Ljava/lang/String;LI1/b;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, LP0/a;->h:LI1/b;

    .line 2
    .line 3
    invoke-interface {v0}, LI1/b;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/ExtendedEditText;->m()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LP0/a;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/ExtendedEditText;->j()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, LP0/a;->j:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public g(Landroid/widget/Button;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP0/a;->m:Landroid/widget/Button;

    .line 2
    .line 3
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-eq p2, p1, :cond_1

    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    if-eq p2, p1, :cond_1

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const-string p1, "AllAppsSearchBarController"

    .line 21
    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    const-string p2, "User pressed ENTER key"

    .line 25
    .line 26
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    const-string p2, "User tapped ime search button"

    .line 31
    .line 32
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    :goto_1
    iget-object p0, p0, LP0/a;->g:Lcom/android/launcher3/views/k;

    .line 36
    .line 37
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getMainAdapterProvider()LP0/g;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, LP0/g;->e()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    invoke-static {p1}, LP0/a;->a(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, LP0/a;->k:[Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
