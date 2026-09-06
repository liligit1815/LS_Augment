.class public Landroidx/slice/widget/RemoteInputView;
.super Landroid/widget/LinearLayout;
.source "RemoteInputView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/RemoteInputView$RemoteEditText;
    }
.end annotation


# static fields
.field public static final q:Ljava/lang/Object;


# instance fields
.field g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

.field private h:Landroid/widget/ImageButton;

.field private i:Landroid/widget/ProgressBar;

.field private j:Landroidx/slice/SliceItem;

.field private k:[Landroid/app/RemoteInput;

.field private l:Landroid/app/RemoteInput;

.field private m:I

.field private n:I

.field private o:I

.field private p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/slice/widget/RemoteInputView;->q:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->setInnerFocusable(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 12
    .line 13
    iput-boolean v1, v0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->i:Z

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Landroid/text/Editable;->length()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->j()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static c(Landroid/content/Context;Landroid/view/ViewGroup;)Landroidx/slice/widget/RemoteInputView;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Li0/c;->c:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroidx/slice/widget/RemoteInputView;

    .line 13
    .line 14
    sget-object p1, Landroidx/slice/widget/RemoteInputView;->q:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public static final d(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x17

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x3e

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x42

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/16 v0, 0xa0

    .line 14
    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method private f()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/slice/widget/RemoteInputView;->p:Z

    .line 3
    .line 4
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Landroid/text/Editable;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->h:Landroid/widget/ImageButton;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->i:Landroid/widget/ProgressBar;

    .line 25
    .line 26
    const/4 v2, 0x4

    .line 27
    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->j()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView;->e()V

    .line 34
    .line 35
    .line 36
    iput-boolean v1, p0, Landroidx/slice/widget/RemoteInputView;->p:Z

    .line 37
    .line 38
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->h:Landroid/widget/ImageButton;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Landroidx/slice/widget/RemoteInputView;->m:I

    .line 8
    .line 9
    iget v1, p0, Landroidx/slice/widget/RemoteInputView;->n:I

    .line 10
    .line 11
    iget v2, p0, Landroidx/slice/widget/RemoteInputView;->o:I

    .line 12
    .line 13
    int-to-float v2, v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static {p0, v0, v1, v3, v2}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v1, 0xc8

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->a()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public dispatchFinishTemporaryDetach()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p0, v0, v1, v2}, Landroid/widget/LinearLayout;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->removeDetachedView(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->dispatchFinishTemporaryDetach()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public dispatchStartTemporaryDetach()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->dispatchStartTemporaryDetach()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->detachViewFromParent(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method e()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method g()V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView;->l:Landroid/app/RemoteInput;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/app/RemoteInput;->getResultKey()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Landroid/content/Intent;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 28
    .line 29
    .line 30
    const/high16 v2, 0x10000000

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Landroidx/slice/widget/RemoteInputView;->k:[Landroid/app/RemoteInput;

    .line 37
    .line 38
    invoke-static {v2, v1, v0}, Landroid/app/RemoteInput;->addResultsToIntent([Landroid/app/RemoteInput;Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->h:Landroid/widget/ImageButton;

    .line 48
    .line 49
    const/4 v3, 0x4

    .line 50
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->i:Landroid/widget/ProgressBar;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 59
    .line 60
    iput-boolean v2, v0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->i:Z

    .line 61
    .line 62
    :try_start_0
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->j:Landroidx/slice/SliceItem;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v0, v3, v1}, Landroidx/slice/SliceItem;->c(Landroid/content/Context;Landroid/content/Intent;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->f()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    const-string v1, "RemoteInput"

    .line 77
    .line 78
    const-string v3, "Unable to send remote input result"

    .line 79
    .line 80
    invoke-static {v1, v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "Failure sending pending intent for inline reply :("

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0}, Landroidx/slice/widget/RemoteInputView;->f()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public h([Landroid/app/RemoteInput;Landroid/app/RemoteInput;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RemoteInputView;->k:[Landroid/app/RemoteInput;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/slice/widget/RemoteInputView;->l:Landroid/app/RemoteInput;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/app/RemoteInput;->getLabel()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i(III)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/slice/widget/RemoteInputView;->m:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/slice/widget/RemoteInputView;->n:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/slice/widget/RemoteInputView;->o:I

    .line 6
    .line 7
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->h:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Li0/b;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/ProgressBar;

    .line 11
    .line 12
    iput-object v0, p0, Landroidx/slice/widget/RemoteInputView;->i:Landroid/widget/ProgressBar;

    .line 13
    .line 14
    sget v0, Li0/b;->b:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/ImageButton;

    .line 21
    .line 22
    iput-object v0, p0, Landroidx/slice/widget/RemoteInputView;->h:Landroid/widget/ImageButton;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 33
    .line 34
    iput-object v1, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 35
    .line 36
    new-instance v2, Landroidx/slice/widget/RemoteInputView$a;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Landroidx/slice/widget/RemoteInputView$a;-><init>(Landroidx/slice/widget/RemoteInputView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 45
    .line 46
    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->setInnerFocusable(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 55
    .line 56
    iput-object p0, v0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->h:Landroidx/slice/widget/RemoteInputView;

    .line 57
    .line 58
    return-void
.end method

.method public onRequestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/RemoteInputView;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onRequestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public setAction(Landroidx/slice/SliceItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RemoteInputView;->j:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-void
.end method
