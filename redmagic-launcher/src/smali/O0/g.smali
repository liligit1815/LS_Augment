.class public final synthetic LO0/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LO0/r;

.field public final synthetic h:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(LO0/r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/g;->g:LO0/r;

    .line 5
    .line 6
    iput-object p2, p0, LO0/g;->h:Landroid/view/View;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LO0/g;->g:LO0/r;

    .line 2
    .line 3
    iget-object p0, p0, LO0/g;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, p0}, LO0/r;->r(LO0/r;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
