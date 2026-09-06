.class LJ/I$h$a;
.super Ljava/lang/Object;
.source "ViewCompat.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ/I$h;->l(Landroid/view/View;LJ/x;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:LJ/Y;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:LJ/x;


# direct methods
.method constructor <init>(Landroid/view/View;LJ/x;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LJ/I$h$a;->h:Landroid/view/View;

    .line 2
    .line 3
    iput-object p2, p0, LJ/I$h$a;->i:LJ/x;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, LJ/I$h$a;->g:LJ/Y;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    .line 1
    invoke-static {p2, p1}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iput-object p2, p0, LJ/I$h$a;->g:LJ/Y;

    .line 6
    .line 7
    iget-object p0, p0, LJ/I$h$a;->i:LJ/x;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, LJ/x;->a(Landroid/view/View;LJ/Y;)LJ/Y;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, LJ/Y;->u()Landroid/view/WindowInsets;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
