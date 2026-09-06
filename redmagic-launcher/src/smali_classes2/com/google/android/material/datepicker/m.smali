.class Lcom/google/android/material/datepicker/m;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "MonthsPagerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/datepicker/m$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/google/android/material/datepicker/m$b;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lcom/google/android/material/datepicker/a;

.field private final b:Lcom/google/android/material/datepicker/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/d<",
            "*>;"
        }
    .end annotation
.end field

.field private final c:Lcom/google/android/material/datepicker/g;

.field private final d:Lcom/google/android/material/datepicker/MaterialCalendar$m;

.field private final e:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/material/datepicker/d;Lcom/google/android/material/datepicker/a;Lcom/google/android/material/datepicker/g;Lcom/google/android/material/datepicker/MaterialCalendar$m;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/datepicker/d<",
            "*>;",
            "Lcom/google/android/material/datepicker/a;",
            "Lcom/google/android/material/datepicker/g;",
            "Lcom/google/android/material/datepicker/MaterialCalendar$m;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/a;->v()Lcom/google/android/material/datepicker/k;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/a;->q()Lcom/google/android/material/datepicker/k;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/a;->u()Lcom/google/android/material/datepicker/k;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-gtz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-gtz v0, :cond_1

    .line 27
    .line 28
    sget v0, Lcom/google/android/material/datepicker/l;->m:I

    .line 29
    .line 30
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialCalendar;->C(Landroid/content/Context;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    mul-int/2addr v0, v1

    .line 35
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialDatePicker;->T(Landroid/content/Context;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialCalendar;->C(Landroid/content/Context;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/4 p1, 0x0

    .line 47
    :goto_0
    add-int/2addr v0, p1

    .line 48
    iput v0, p0, Lcom/google/android/material/datepicker/m;->e:I

    .line 49
    .line 50
    iput-object p3, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 51
    .line 52
    iput-object p2, p0, Lcom/google/android/material/datepicker/m;->b:Lcom/google/android/material/datepicker/d;

    .line 53
    .line 54
    iput-object p4, p0, Lcom/google/android/material/datepicker/m;->c:Lcom/google/android/material/datepicker/g;

    .line 55
    .line 56
    iput-object p5, p0, Lcom/google/android/material/datepicker/m;->d:Lcom/google/android/material/datepicker/MaterialCalendar$m;

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 64
    .line 65
    const-string p1, "currentPage cannot be after lastPage"

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0

    .line 71
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 72
    .line 73
    const-string p1, "firstPage cannot be after currentPage"

    .line 74
    .line 75
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p0
.end method

.method static synthetic f(Lcom/google/android/material/datepicker/m;)Lcom/google/android/material/datepicker/MaterialCalendar$m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/m;->d:Lcom/google/android/material/datepicker/MaterialCalendar$m;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method g(I)Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/a;->v()Lcom/google/android/material/datepicker/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/k;->y(I)Lcom/google/android/material/datepicker/k;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/a;->t()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/a;->v()Lcom/google/android/material/datepicker/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/k;->y(I)Lcom/google/android/material/datepicker/k;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/k;->x()J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    return-wide p0
.end method

.method h(I)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/m;->g(I)Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/k;->w()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method i(Lcom/google/android/material/datepicker/k;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/a;->v()Lcom/google/android/material/datepicker/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/k;->z(Lcom/google/android/material/datepicker/k;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public j(Lcom/google/android/material/datepicker/m$b;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/datepicker/a;->v()Lcom/google/android/material/datepicker/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Lcom/google/android/material/datepicker/k;->y(I)Lcom/google/android/material/datepicker/k;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v0, p1, Lcom/google/android/material/datepicker/m$b;->a:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/google/android/material/datepicker/k;->w()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/google/android/material/datepicker/m$b;->b:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    .line 21
    .line 22
    sget v0, LX2/f;->C:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/GridView;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->b()Lcom/google/android/material/datepicker/l;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->b()Lcom/google/android/material/datepicker/l;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/google/android/material/datepicker/l;->g:Lcom/google/android/material/datepicker/k;

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Lcom/google/android/material/datepicker/k;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/widget/GridView;->invalidate()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->b()Lcom/google/android/material/datepicker/l;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, p1}, Lcom/google/android/material/datepicker/l;->q(Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    new-instance v0, Lcom/google/android/material/datepicker/l;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/google/android/material/datepicker/m;->b:Lcom/google/android/material/datepicker/d;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/google/android/material/datepicker/m;->a:Lcom/google/android/material/datepicker/a;

    .line 64
    .line 65
    iget-object v3, p0, Lcom/google/android/material/datepicker/m;->c:Lcom/google/android/material/datepicker/g;

    .line 66
    .line 67
    invoke-direct {v0, p2, v1, v2, v3}, Lcom/google/android/material/datepicker/l;-><init>(Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/d;Lcom/google/android/material/datepicker/a;Lcom/google/android/material/datepicker/g;)V

    .line 68
    .line 69
    .line 70
    iget p2, p2, Lcom/google/android/material/datepicker/k;->j:I

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    new-instance p2, Lcom/google/android/material/datepicker/m$a;

    .line 79
    .line 80
    invoke-direct {p2, p0, p1}, Lcom/google/android/material/datepicker/m$a;-><init>(Lcom/google/android/material/datepicker/m;Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public k(Landroid/view/ViewGroup;I)Lcom/google/android/material/datepicker/m$b;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, LX2/h;->r:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialDatePicker;->T(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 29
    .line 30
    const/4 v0, -0x1

    .line 31
    iget p0, p0, Lcom/google/android/material/datepicker/m;->e:I

    .line 32
    .line 33
    invoke-direct {p1, v0, p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Lcom/google/android/material/datepicker/m$b;

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-direct {p0, p2, p1}, Lcom/google/android/material/datepicker/m$b;-><init>(Landroid/widget/LinearLayout;Z)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    new-instance p0, Lcom/google/android/material/datepicker/m$b;

    .line 47
    .line 48
    invoke-direct {p0, p2, v1}, Lcom/google/android/material/datepicker/m$b;-><init>(Landroid/widget/LinearLayout;Z)V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/material/datepicker/m$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/datepicker/m;->j(Lcom/google/android/material/datepicker/m$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/datepicker/m;->k(Landroid/view/ViewGroup;I)Lcom/google/android/material/datepicker/m$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
