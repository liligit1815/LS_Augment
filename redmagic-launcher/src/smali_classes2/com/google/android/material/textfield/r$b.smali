.class Lcom/google/android/material/textfield/r$b;
.super Ljava/lang/Object;
.source "EndCompoundLayout.java"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/textfield/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/android/material/textfield/r;


# direct methods
.method constructor <init>(Lcom/google/android/material/textfield/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/material/textfield/TextInputLayout;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/google/android/material/textfield/r;->c(Lcom/google/android/material/textfield/r;)Landroid/text/TextWatcher;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Landroid/widget/EditText;->getOnFocusChangeListener()Landroid/view/View$OnFocusChangeListener;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/google/android/material/textfield/r;->m()Lcom/google/android/material/textfield/s;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lcom/google/android/material/textfield/s;->e()Landroid/view/View$OnFocusChangeListener;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-ne v0, v1, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {v0, p1}, Lcom/google/android/material/textfield/r;->b(Lcom/google/android/material/textfield/r;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->c(Lcom/google/android/material/textfield/r;)Landroid/text/TextWatcher;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    iget-object p1, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/google/android/material/textfield/r;->m()Lcom/google/android/material/textfield/s;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/google/android/material/textfield/r;->a(Lcom/google/android/material/textfield/r;)Landroid/widget/EditText;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/s;->n(Landroid/widget/EditText;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/google/android/material/textfield/r$b;->a:Lcom/google/android/material/textfield/r;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/google/android/material/textfield/r;->m()Lcom/google/android/material/textfield/s;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {p0, p1}, Lcom/google/android/material/textfield/r;->d(Lcom/google/android/material/textfield/r;Lcom/google/android/material/textfield/s;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
