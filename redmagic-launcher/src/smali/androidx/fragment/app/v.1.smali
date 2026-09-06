.class public Landroidx/fragment/app/v;
.super Ljava/lang/Object;
.source "FragmentController.java"


# instance fields
.field private final a:Landroidx/fragment/app/x;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/fragment/app/x<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroidx/fragment/app/x;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/x<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Landroidx/fragment/app/x;)Landroidx/fragment/app/v;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/x<",
            "*>;)",
            "Landroidx/fragment/app/v;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/fragment/app/v;

    .line 2
    .line 3
    const-string v1, "callbacks == null"

    .line 4
    .line 5
    invoke-static {p0, v1}, LI/h;->g(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroidx/fragment/app/x;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Landroidx/fragment/app/v;-><init>(Landroidx/fragment/app/x;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a(Landroidx/fragment/app/n;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p0, p1}, Landroidx/fragment/app/F;->m(Landroidx/fragment/app/x;Landroidx/fragment/app/u;Landroidx/fragment/app/n;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->x()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/F;->A(Landroid/view/MenuItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->B()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->D()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->M()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->R()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->T()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroidx/fragment/app/F;->a0(Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public l()Landroidx/fragment/app/F;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    return-object p0
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->V0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/v;->a:Landroidx/fragment/app/x;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/x;->k:Landroidx/fragment/app/F;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/F;->x0()Landroid/view/LayoutInflater$Factory2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
