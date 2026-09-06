.class public final synthetic Landroidx/fragment/app/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/fragment/app/W$c;

.field public final synthetic h:Landroidx/fragment/app/W$c;

.field public final synthetic i:Z

.field public final synthetic j:Lo/a;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/g;->g:Landroidx/fragment/app/W$c;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/g;->h:Landroidx/fragment/app/W$c;

    .line 7
    .line 8
    iput-boolean p3, p0, Landroidx/fragment/app/g;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Landroidx/fragment/app/g;->j:Lo/a;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/g;->g:Landroidx/fragment/app/W$c;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/fragment/app/g;->h:Landroidx/fragment/app/W$c;

    .line 4
    .line 5
    iget-boolean v2, p0, Landroidx/fragment/app/g;->i:Z

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/fragment/app/g;->j:Lo/a;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Landroidx/fragment/app/k;->x(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
