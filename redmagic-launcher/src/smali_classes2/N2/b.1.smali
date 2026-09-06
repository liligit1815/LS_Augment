.class public final synthetic LN2/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LN2/f;

.field public final synthetic h:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(LN2/f;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN2/b;->g:LN2/f;

    .line 5
    .line 6
    iput-object p2, p0, LN2/b;->h:Landroid/view/View;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LN2/b;->g:LN2/f;

    .line 2
    .line 3
    iget-object p0, p0, LN2/b;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, p0}, LN2/f;->e(LN2/f;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
