.class Landroidx/appcompat/view/menu/d$c$a;
.super Ljava/lang/Object;
.source "CascadingMenuPopup.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/view/menu/d$c;->a(Landroidx/appcompat/view/menu/g;Landroid/view/MenuItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/view/menu/d$d;

.field final synthetic h:Landroid/view/MenuItem;

.field final synthetic i:Landroidx/appcompat/view/menu/g;

.field final synthetic j:Landroidx/appcompat/view/menu/d$c;


# direct methods
.method constructor <init>(Landroidx/appcompat/view/menu/d$c;Landroidx/appcompat/view/menu/d$d;Landroid/view/MenuItem;Landroidx/appcompat/view/menu/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/d$c$a;->j:Landroidx/appcompat/view/menu/d$c;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/appcompat/view/menu/d$c$a;->g:Landroidx/appcompat/view/menu/d$d;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/appcompat/view/menu/d$c$a;->h:Landroid/view/MenuItem;

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/appcompat/view/menu/d$c$a;->i:Landroidx/appcompat/view/menu/g;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d$c$a;->g:Landroidx/appcompat/view/menu/d$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/appcompat/view/menu/d$c$a;->j:Landroidx/appcompat/view/menu/d$c;

    .line 6
    .line 7
    iget-object v1, v1, Landroidx/appcompat/view/menu/d$c;->g:Landroidx/appcompat/view/menu/d;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    iput-boolean v2, v1, Landroidx/appcompat/view/menu/d;->G:Z

    .line 11
    .line 12
    iget-object v0, v0, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroidx/appcompat/view/menu/g;->e(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/appcompat/view/menu/d$c$a;->j:Landroidx/appcompat/view/menu/d$c;

    .line 19
    .line 20
    iget-object v0, v0, Landroidx/appcompat/view/menu/d$c;->g:Landroidx/appcompat/view/menu/d;

    .line 21
    .line 22
    iput-boolean v1, v0, Landroidx/appcompat/view/menu/d;->G:Z

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/d$c$a;->h:Landroid/view/MenuItem;

    .line 25
    .line 26
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Landroidx/appcompat/view/menu/d$c$a;->h:Landroid/view/MenuItem;

    .line 33
    .line 34
    invoke-interface {v0}, Landroid/view/MenuItem;->hasSubMenu()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Landroidx/appcompat/view/menu/d$c$a;->i:Landroidx/appcompat/view/menu/g;

    .line 41
    .line 42
    iget-object p0, p0, Landroidx/appcompat/view/menu/d$c$a;->h:Landroid/view/MenuItem;

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/view/menu/g;->L(Landroid/view/MenuItem;I)Z

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
