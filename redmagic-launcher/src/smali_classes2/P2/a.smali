.class public final synthetic LP2/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP2/d;

.field public final synthetic h:Landroid/view/SurfaceControl;

.field public final synthetic i:Landroid/graphics/Rect;


# direct methods
.method public synthetic constructor <init>(LP2/d;Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP2/a;->g:LP2/d;

    .line 5
    .line 6
    iput-object p2, p0, LP2/a;->h:Landroid/view/SurfaceControl;

    .line 7
    .line 8
    iput-object p3, p0, LP2/a;->i:Landroid/graphics/Rect;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LP2/a;->g:LP2/d;

    .line 2
    .line 3
    iget-object v1, p0, LP2/a;->h:Landroid/view/SurfaceControl;

    .line 4
    .line 5
    iget-object p0, p0, LP2/a;->i:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LP2/d;->a(LP2/d;Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
