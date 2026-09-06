.class public Landroidx/appcompat/widget/O;
.super Landroidx/appcompat/widget/M;
.source "MenuPopupWindow.java"

# interfaces
.implements Landroidx/appcompat/widget/N;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/O$b;,
        Landroidx/appcompat/widget/O$a;,
        Landroidx/appcompat/widget/O$c;
    }
.end annotation


# instance fields
.field private M:Landroidx/appcompat/widget/N;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/M;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public F(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    check-cast p1, Landroid/transition/Transition;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroidx/appcompat/widget/O$a;->a(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    check-cast p1, Landroid/transition/Transition;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroidx/appcompat/widget/O$a;->b(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H(Landroidx/appcompat/widget/N;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/O;->M:Landroidx/appcompat/widget/N;

    .line 2
    .line 3
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroidx/appcompat/widget/O$b;->a(Landroid/widget/PopupWindow;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Landroidx/appcompat/view/menu/g;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/O;->M:Landroidx/appcompat/widget/N;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Landroidx/appcompat/widget/N;->a(Landroidx/appcompat/view/menu/g;Landroid/view/MenuItem;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Landroidx/appcompat/view/menu/g;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/O;->M:Landroidx/appcompat/widget/N;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Landroidx/appcompat/widget/N;->c(Landroidx/appcompat/view/menu/g;Landroid/view/MenuItem;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method f(Landroid/content/Context;Z)Landroidx/appcompat/widget/I;
    .locals 1

    .line 1
    new-instance v0, Landroidx/appcompat/widget/O$c;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Landroidx/appcompat/widget/O$c;-><init>(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/O$c;->setHoverListener(Landroidx/appcompat/widget/N;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
