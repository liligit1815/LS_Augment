.class public LY3/a;
.super Landroidx/recyclerview/widget/h;
.source "DefaultItemTouchHelper.java"


# instance fields
.field private K:LY3/b;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, LY3/b;

    invoke-direct {v0}, LY3/b;-><init>()V

    invoke-direct {p0, v0}, LY3/a;-><init>(LY3/b;)V

    return-void
.end method

.method private constructor <init>(LY3/b;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/h;-><init>(Landroidx/recyclerview/widget/h$e;)V

    .line 3
    iput-object p1, p0, LY3/a;->K:LY3/b;

    return-void
.end method


# virtual methods
.method public A()LY3/c;
    .locals 0

    .line 1
    iget-object p0, p0, LY3/a;->K:LY3/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LY3/b;->C()LY3/c;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LY3/a;->K:LY3/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LY3/b;->D(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(LY3/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, LY3/a;->K:LY3/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LY3/b;->E(LY3/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(LY3/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, LY3/a;->K:LY3/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LY3/b;->F(LY3/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E(LY3/e;)V
    .locals 0

    .line 1
    iget-object p0, p0, LY3/a;->K:LY3/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LY3/b;->G(LY3/e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
