.class final Landroidx/appcompat/app/g$u;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Landroidx/appcompat/view/menu/m$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "u"
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/app/g;


# direct methods
.method constructor <init>(Landroidx/appcompat/app/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/appcompat/view/menu/g;Z)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->D()Landroidx/appcompat/view/menu/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    :goto_0
    iget-object v3, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    move-object p1, v0

    .line 16
    :cond_1
    invoke-virtual {v3, p1}, Landroidx/appcompat/app/g;->j0(Landroid/view/Menu;)Landroidx/appcompat/app/g$t;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_3

    .line 21
    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    iget-object p2, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 25
    .line 26
    iget v2, p1, Landroidx/appcompat/app/g$t;->a:I

    .line 27
    .line 28
    invoke-virtual {p2, v2, p1, v0}, Landroidx/appcompat/app/g;->V(ILandroidx/appcompat/app/g$t;Landroid/view/Menu;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/app/g;->Z(Landroidx/appcompat/app/g$t;Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget-object p0, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/g;->Z(Landroidx/appcompat/app/g$t;Z)V

    .line 40
    .line 41
    .line 42
    :cond_3
    return-void
.end method

.method public b(Landroidx/appcompat/view/menu/g;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->D()Landroidx/appcompat/view/menu/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 8
    .line 9
    iget-boolean v1, v0, Landroidx/appcompat/app/g;->M:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/appcompat/app/g;->s0()Landroid/view/Window$Callback;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Landroidx/appcompat/app/g$u;->g:Landroidx/appcompat/app/g;

    .line 20
    .line 21
    iget-boolean p0, p0, Landroidx/appcompat/app/g;->X:Z

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/16 p0, 0x6c

    .line 26
    .line 27
    invoke-interface {v0, p0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method
