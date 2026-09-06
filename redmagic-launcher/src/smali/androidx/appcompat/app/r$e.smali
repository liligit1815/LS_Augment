.class Landroidx/appcompat/app/r$e;
.super Ljava/lang/Object;
.source "ToolbarActionBar.java"

# interfaces
.implements Landroidx/appcompat/app/g$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Landroidx/appcompat/app/r;


# direct methods
.method constructor <init>(Landroidx/appcompat/app/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/r$e;->a:Landroidx/appcompat/app/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Landroidx/appcompat/app/r$e;->a:Landroidx/appcompat/app/r;

    .line 4
    .line 5
    iget-boolean v0, p1, Landroidx/appcompat/app/r;->d:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Landroidx/appcompat/app/r;->a:Landroidx/appcompat/widget/G;

    .line 10
    .line 11
    invoke-interface {p1}, Landroidx/appcompat/widget/G;->setMenuPrepared()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Landroidx/appcompat/app/r$e;->a:Landroidx/appcompat/app/r;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Landroidx/appcompat/app/r;->d:Z

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/app/r$e;->a:Landroidx/appcompat/app/r;

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/app/r;->a:Landroidx/appcompat/widget/G;

    .line 8
    .line 9
    invoke-interface {p0}, Landroidx/appcompat/widget/G;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method
