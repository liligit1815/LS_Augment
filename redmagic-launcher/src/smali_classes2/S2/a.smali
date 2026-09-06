.class public abstract LS2/a;
.super Ljava/lang/Object;
.source "PipContentOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LS2/a$a;
    }
.end annotation


# instance fields
.field protected a:Landroid/view/SurfaceControl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V
.end method

.method public b()Landroid/view/SurfaceControl;
    .locals 0
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract c(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/Rect;F)V
.end method
