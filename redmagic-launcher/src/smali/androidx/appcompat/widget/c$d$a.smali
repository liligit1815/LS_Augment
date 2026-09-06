.class Landroidx/appcompat/widget/c$d$a;
.super Landroidx/appcompat/widget/K;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/c$d;-><init>(Landroidx/appcompat/widget/c;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic p:Landroidx/appcompat/widget/c;

.field final synthetic q:Landroidx/appcompat/widget/c$d;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/c$d;Landroid/view/View;Landroidx/appcompat/widget/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/c$d$a;->q:Landroidx/appcompat/widget/c$d;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/appcompat/widget/c$d$a;->p:Landroidx/appcompat/widget/c;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/appcompat/widget/K;-><init>(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Landroidx/appcompat/view/menu/p;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/c$d$a;->q:Landroidx/appcompat/widget/c$d;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/c$d;->j:Landroidx/appcompat/widget/c;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/c;->E:Landroidx/appcompat/widget/c$e;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/l;->c()Landroidx/appcompat/view/menu/k;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/c$d$a;->q:Landroidx/appcompat/widget/c$d;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/c$d;->j:Landroidx/appcompat/widget/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/c;->I()Z

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/c$d$a;->q:Landroidx/appcompat/widget/c$d;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/c$d;->j:Landroidx/appcompat/widget/c;

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/c;->G:Landroidx/appcompat/widget/c$c;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/c;->z()Z

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method
