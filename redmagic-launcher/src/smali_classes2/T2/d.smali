.class public final synthetic LT2/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/view/SurfaceControl;


# direct methods
.method public synthetic constructor <init>(Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT2/d;->g:Landroid/view/SurfaceControl;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LT2/d;->g:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/SurfaceControl;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
