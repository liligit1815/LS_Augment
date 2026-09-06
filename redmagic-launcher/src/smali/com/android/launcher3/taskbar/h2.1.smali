.class public final synthetic Lcom/android/launcher3/taskbar/h2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/taskbar/j2$f;


# instance fields
.field public final synthetic a:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic b:Landroid/view/SurfaceControl;


# direct methods
.method public synthetic constructor <init>(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/h2;->a:Landroid/view/SurfaceControl$Transaction;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/h2;->b:Landroid/view/SurfaceControl;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(FFFF)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/h2;->a:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/h2;->b:Landroid/view/SurfaceControl;

    .line 4
    .line 5
    move v2, p1

    .line 6
    move v3, p2

    .line 7
    move v4, p3

    .line 8
    move v5, p4

    .line 9
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/taskbar/j2;->V(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;FFFF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
