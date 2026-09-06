.class public final synthetic Landroidx/fragment/app/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/fragment/app/k;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Landroidx/fragment/app/k$a;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/k;Landroid/view/View;Landroidx/fragment/app/k$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/l;->g:Landroidx/fragment/app/k;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/l;->h:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Landroidx/fragment/app/l;->i:Landroidx/fragment/app/k$a;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/l;->g:Landroidx/fragment/app/k;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/fragment/app/l;->h:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/fragment/app/l;->i:Landroidx/fragment/app/k$a;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroidx/fragment/app/k$f;->a(Landroidx/fragment/app/k;Landroid/view/View;Landroidx/fragment/app/k$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
