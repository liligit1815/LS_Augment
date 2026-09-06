.class Lcom/google/android/material/datepicker/MaterialCalendar$h;
.super LJ/a;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/MaterialCalendar;->v(Landroid/view/View;Lcom/google/android/material/datepicker/m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic j:Lcom/google/android/material/datepicker/MaterialCalendar;


# direct methods
.method constructor <init>(Lcom/google/android/material/datepicker/MaterialCalendar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$h;->j:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 2
    .line 3
    invoke-direct {p0}, LJ/a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Landroid/view/View;LK/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$h;->j:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialCalendar;->t(Lcom/google/android/material/datepicker/MaterialCalendar;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/material/datepicker/MaterialCalendar$h;->j:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 17
    .line 18
    sget p1, LX2/j;->I:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/datepicker/MaterialCalendar$h;->j:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 26
    .line 27
    sget p1, LX2/j;->G:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_0
    invoke-virtual {p2, p0}, LK/d;->u0(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
