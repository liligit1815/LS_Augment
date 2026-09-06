.class public final synthetic Lu2/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lu2/p$a;

.field public final synthetic h:Landroid/os/IBinder;

.field public final synthetic i:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/o;->g:Lu2/p$a;

    .line 5
    .line 6
    iput-object p2, p0, Lu2/o;->h:Landroid/os/IBinder;

    .line 7
    .line 8
    iput-object p3, p0, Lu2/o;->i:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lu2/o;->g:Lu2/p$a;

    .line 2
    .line 3
    iget-object v1, p0, Lu2/o;->h:Landroid/os/IBinder;

    .line 4
    .line 5
    iget-object p0, p0, Lu2/o;->i:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lu2/p$a;->p2(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
