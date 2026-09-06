.class Lcom/google/android/material/datepicker/MaterialCalendar$d;
.super Lcom/google/android/material/datepicker/o;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/MaterialCalendar;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic q:I

.field final synthetic r:Lcom/google/android/material/datepicker/MaterialCalendar;


# direct methods
.method constructor <init>(Lcom/google/android/material/datepicker/MaterialCalendar;Landroid/content/Context;IZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->r:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 2
    .line 3
    iput p5, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->q:I

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4}, Lcom/google/android/material/datepicker/o;-><init>(Landroid/content/Context;IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method protected f(Landroidx/recyclerview/widget/RecyclerView$State;[I)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->q:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->r:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialCalendar;->o(Lcom/google/android/material/datepicker/MaterialCalendar;)Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    aput p1, p2, v1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->r:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/google/android/material/datepicker/MaterialCalendar;->o(Lcom/google/android/material/datepicker/MaterialCalendar;)Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    aput p0, p2, v0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->r:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/google/android/material/datepicker/MaterialCalendar;->o(Lcom/google/android/material/datepicker/MaterialCalendar;)Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    aput p1, p2, v1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/google/android/material/datepicker/MaterialCalendar$d;->r:Lcom/google/android/material/datepicker/MaterialCalendar;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/google/android/material/datepicker/MaterialCalendar;->o(Lcom/google/android/material/datepicker/MaterialCalendar;)Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    aput p0, p2, v0

    .line 55
    .line 56
    return-void
.end method
