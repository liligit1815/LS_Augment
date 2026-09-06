.class public final synthetic LR2/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/view/SurfaceView;

.field public final synthetic h:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR2/d;->g:Landroid/view/SurfaceView;

    .line 5
    .line 6
    iput-object p2, p0, LR2/d;->h:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LR2/d;->g:Landroid/view/SurfaceView;

    .line 2
    .line 3
    iget-object p0, p0, LR2/d;->h:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-static {v0, p0}, LR2/b$b;->b(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
