.class public final synthetic LP2/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP2/d;

.field public final synthetic h:Landroid/view/SurfaceControl;


# direct methods
.method public synthetic constructor <init>(LP2/d;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP2/c;->g:LP2/d;

    .line 5
    .line 6
    iput-object p2, p0, LP2/c;->h:Landroid/view/SurfaceControl;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LP2/c;->g:LP2/d;

    .line 2
    .line 3
    iget-object p0, p0, LP2/c;->h:Landroid/view/SurfaceControl;

    .line 4
    .line 5
    invoke-static {v0, p0}, LP2/d;->b(LP2/d;Landroid/view/SurfaceControl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
