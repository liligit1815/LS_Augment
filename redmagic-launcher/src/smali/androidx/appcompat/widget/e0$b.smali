.class Landroidx/appcompat/widget/e0$b;
.super LJ/U;
.source "ToolbarWidgetWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/e0;->setupAnimatorToVisibility(IJ)LJ/S;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private a:Z

.field final synthetic b:I

.field final synthetic c:Landroidx/appcompat/widget/e0;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/e0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/e0$b;->c:Landroidx/appcompat/widget/e0;

    .line 2
    .line 3
    iput p2, p0, Landroidx/appcompat/widget/e0$b;->b:I

    .line 4
    .line 5
    invoke-direct {p0}, LJ/U;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Landroidx/appcompat/widget/e0$b;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Landroidx/appcompat/widget/e0$b;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Landroidx/appcompat/widget/e0$b;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Landroidx/appcompat/widget/e0$b;->c:Landroidx/appcompat/widget/e0;

    .line 6
    .line 7
    iget-object p1, p1, Landroidx/appcompat/widget/e0;->a:Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    iget p0, p0, Landroidx/appcompat/widget/e0$b;->b:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/e0$b;->c:Landroidx/appcompat/widget/e0;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/e0;->a:Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
