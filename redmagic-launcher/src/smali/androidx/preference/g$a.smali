.class Landroidx/preference/g$a;
.super LJ/a;
.source "PreferenceRecyclerViewAccessibilityDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/preference/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic j:Landroidx/preference/g;


# direct methods
.method constructor <init>(Landroidx/preference/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/preference/g$a;->j:Landroidx/preference/g;

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
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/preference/g$a;->j:Landroidx/preference/g;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/preference/g;->m:LJ/a;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Landroidx/preference/g$a;->j:Landroidx/preference/g;

    .line 9
    .line 10
    iget-object v0, v0, Landroidx/preference/g;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p0, p0, Landroidx/preference/g$a;->j:Landroidx/preference/g;

    .line 17
    .line 18
    iget-object p0, p0, Landroidx/preference/g;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    instance-of v0, p0, Landroidx/preference/c;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    check-cast p0, Landroidx/preference/c;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroidx/preference/c;->i(I)Landroidx/preference/Preference;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->b0(LK/d;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public j(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/g$a;->j:Landroidx/preference/g;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/preference/g;->m:LJ/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, LJ/a;->j(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
