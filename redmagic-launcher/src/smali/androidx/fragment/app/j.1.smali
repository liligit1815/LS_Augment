.class public final synthetic Landroidx/fragment/app/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/fragment/app/k$c;

.field public final synthetic h:Landroidx/fragment/app/W$c;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/j;->g:Landroidx/fragment/app/k$c;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/j;->h:Landroidx/fragment/app/W$c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/j;->g:Landroidx/fragment/app/k$c;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/j;->h:Landroidx/fragment/app/W$c;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroidx/fragment/app/k;->B(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
