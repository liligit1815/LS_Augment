.class Lcom/zte/mifavor/widget/DatePickerZTE$a;
.super Ljava/lang/Object;
.source "DatePickerZTE.java"

# interfaces
.implements Lcom/zte/mifavor/widget/NumberPickerZTE$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/DatePickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/DatePickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/DatePickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->h(Lcom/zte/mifavor/widget/DatePickerZTE;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/zte/mifavor/widget/DatePickerZTE;->a(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->b(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    const/4 v2, 0x2

    .line 33
    const/4 v3, 0x5

    .line 34
    if-ne p1, v0, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sub-int/2addr p3, p2

    .line 43
    invoke-virtual {p1, v3, p3}, Ljava/util/Calendar;->add(II)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->c(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-ne p1, v0, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sub-int/2addr p3, p2

    .line 62
    invoke-virtual {p1, v2, p3}, Ljava/util/Calendar;->add(II)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 67
    .line 68
    invoke-static {p2}, Lcom/zte/mifavor/widget/DatePickerZTE;->e(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    if-ne p1, p2, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 75
    .line 76
    invoke-static {p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iget-object p3, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 94
    .line 95
    invoke-static {p3}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    invoke-virtual {p3, v2}, Ljava/util/Calendar;->get(I)I

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 104
    .line 105
    invoke-static {v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    invoke-static {p1, p2, p3, v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->g(Lcom/zte/mifavor/widget/DatePickerZTE;III)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->i(Lcom/zte/mifavor/widget/DatePickerZTE;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$a;->a:Lcom/zte/mifavor/widget/DatePickerZTE;

    .line 122
    .line 123
    invoke-static {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->f(Lcom/zte/mifavor/widget/DatePickerZTE;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 128
    .line 129
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 130
    .line 131
    .line 132
    throw p0
.end method
