.class public final synthetic Landroidx/fragment/app/V;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/fragment/app/W;

.field public final synthetic h:Landroidx/fragment/app/W$b;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/W;Landroidx/fragment/app/W$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/V;->g:Landroidx/fragment/app/W;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/V;->h:Landroidx/fragment/app/W$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/V;->g:Landroidx/fragment/app/W;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/V;->h:Landroidx/fragment/app/W$b;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroidx/fragment/app/W;->b(Landroidx/fragment/app/W;Landroidx/fragment/app/W$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
