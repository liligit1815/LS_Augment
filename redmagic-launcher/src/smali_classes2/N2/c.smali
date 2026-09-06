.class public final synthetic LN2/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LN2/f;

.field public final synthetic h:LN2/h;

.field public final synthetic i:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(LN2/f;LN2/h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN2/c;->g:LN2/f;

    .line 5
    .line 6
    iput-object p2, p0, LN2/c;->h:LN2/h;

    .line 7
    .line 8
    iput-object p3, p0, LN2/c;->i:Landroid/view/View;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LN2/c;->g:LN2/f;

    .line 2
    .line 3
    iget-object v1, p0, LN2/c;->h:LN2/h;

    .line 4
    .line 5
    iget-object p0, p0, LN2/c;->i:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LN2/f;->d(LN2/f;LN2/h;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
