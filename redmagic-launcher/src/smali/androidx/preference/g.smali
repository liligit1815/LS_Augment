.class public Landroidx/preference/g;
.super Landroidx/recyclerview/widget/q;
.source "PreferenceRecyclerViewAccessibilityDelegate.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final l:Landroidx/recyclerview/widget/RecyclerView;

.field final m:LJ/a;

.field final n:LJ/a;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/q;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroidx/recyclerview/widget/q;->n()LJ/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Landroidx/preference/g;->m:LJ/a;

    .line 9
    .line 10
    new-instance v0, Landroidx/preference/g$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Landroidx/preference/g$a;-><init>(Landroidx/preference/g;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Landroidx/preference/g;->n:LJ/a;

    .line 16
    .line 17
    iput-object p1, p0, Landroidx/preference/g;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public n()LJ/a;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/g;->n:LJ/a;

    .line 2
    .line 3
    return-object p0
.end method
