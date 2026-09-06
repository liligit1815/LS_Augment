.class Lcom/google/android/material/textfield/v$a;
.super Ljava/lang/Object;
.source "MaterialAutoCompleteTextView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/textfield/v;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/google/android/material/textfield/v;


# direct methods
.method constructor <init>(Lcom/google/android/material/textfield/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 2
    .line 3
    if-gez p3, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/widget/M;->i()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 23
    .line 24
    invoke-static {v0, p1}, Lcom/google/android/material/textfield/v;->c(Lcom/google/android/material/textfield/v;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    if-gez p3, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    :goto_1
    move-object v2, p2

    .line 41
    move v3, p3

    .line 42
    move-wide v4, p4

    .line 43
    goto :goto_3

    .line 44
    :cond_2
    :goto_2
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Landroidx/appcompat/widget/M;->l()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroidx/appcompat/widget/M;->k()I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Landroidx/appcompat/widget/M;->j()J

    .line 71
    .line 72
    .line 73
    move-result-wide p4

    .line 74
    goto :goto_1

    .line 75
    :goto_3
    iget-object p1, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Landroidx/appcompat/widget/M;->getListView()Landroid/widget/ListView;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 86
    .line 87
    .line 88
    :cond_3
    iget-object p0, p0, Lcom/google/android/material/textfield/v$a;->g:Lcom/google/android/material/textfield/v;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/google/android/material/textfield/v;->b(Lcom/google/android/material/textfield/v;)Landroidx/appcompat/widget/M;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->dismiss()V

    .line 95
    .line 96
    .line 97
    return-void
.end method
