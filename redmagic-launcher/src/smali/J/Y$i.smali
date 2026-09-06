.class LJ/Y$i;
.super LJ/Y$h;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "i"
.end annotation


# static fields
.field static final l:LJ/Y;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {v0}, LJ/Y;->v(Landroid/view/WindowInsets;)LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, LJ/Y$i;->l:LJ/Y;

    .line 8
    .line 9
    return-void
.end method

.method constructor <init>(LJ/Y;LJ/Y$i;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, LJ/Y$h;-><init>(LJ/Y;LJ/Y$h;)V

    return-void
.end method

.method constructor <init>(LJ/Y;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LJ/Y$h;-><init>(LJ/Y;Landroid/view/WindowInsets;)V

    return-void
.end method


# virtual methods
.method final d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(I)LB/b;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {p1}, LJ/Y$l;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, LB/b;->c(Landroid/graphics/Insets;)LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public p(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {p1}, LJ/Y$l;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->isVisible(I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
