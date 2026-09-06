.class Landroidx/appcompat/view/h$a;
.super LJ/U;
.source "ViewPropertyAnimatorCompatSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/view/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private a:Z

.field private b:I

.field final synthetic c:Landroidx/appcompat/view/h;


# direct methods
.method constructor <init>(Landroidx/appcompat/view/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/h$a;->c:Landroidx/appcompat/view/h;

    .line 2
    .line 3
    invoke-direct {p0}, LJ/U;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Landroidx/appcompat/view/h$a;->a:Z

    .line 8
    .line 9
    iput p1, p0, Landroidx/appcompat/view/h$a;->b:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Landroidx/appcompat/view/h$a;->b:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Landroidx/appcompat/view/h$a;->b:I

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/appcompat/view/h$a;->c:Landroidx/appcompat/view/h;

    .line 8
    .line 9
    iget-object v0, v0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Landroidx/appcompat/view/h$a;->c:Landroidx/appcompat/view/h;

    .line 18
    .line 19
    iget-object p1, p1, Landroidx/appcompat/view/h;->d:LJ/T;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p1, v0}, LJ/T;->b(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/view/h$a;->d()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Landroidx/appcompat/view/h$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Landroidx/appcompat/view/h$a;->a:Z

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/appcompat/view/h$a;->c:Landroidx/appcompat/view/h;

    .line 10
    .line 11
    iget-object p0, p0, Landroidx/appcompat/view/h;->d:LJ/T;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-interface {p0, p1}, LJ/T;->c(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/appcompat/view/h$a;->b:I

    .line 3
    .line 4
    iput-boolean v0, p0, Landroidx/appcompat/view/h$a;->a:Z

    .line 5
    .line 6
    iget-object p0, p0, Landroidx/appcompat/view/h$a;->c:Landroidx/appcompat/view/h;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/appcompat/view/h;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
