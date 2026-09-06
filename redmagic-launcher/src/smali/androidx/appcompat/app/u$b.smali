.class Landroidx/appcompat/app/u$b;
.super LJ/U;
.source "WindowDecorActionBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroidx/appcompat/app/u;


# direct methods
.method constructor <init>(Landroidx/appcompat/app/u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/u$b;->a:Landroidx/appcompat/app/u;

    .line 2
    .line 3
    invoke-direct {p0}, LJ/U;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/u$b;->a:Landroidx/appcompat/app/u;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Landroidx/appcompat/app/u;->y:Landroidx/appcompat/view/h;

    .line 5
    .line 6
    iget-object p0, p0, Landroidx/appcompat/app/u;->e:Landroidx/appcompat/widget/ActionBarContainer;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
