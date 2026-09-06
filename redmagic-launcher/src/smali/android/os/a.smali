.class public final synthetic Landroid/os/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/o3;

.field public final synthetic h:Landroid/os/BinderUtils$LifecycleBinderWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroid/os/a;->g:Lcom/android/launcher3/util/o3;

    .line 5
    .line 6
    iput-object p2, p0, Landroid/os/a;->h:Landroid/os/BinderUtils$LifecycleBinderWrapper;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroid/os/a;->g:Lcom/android/launcher3/util/o3;

    .line 2
    .line 3
    iget-object p0, p0, Landroid/os/a;->h:Landroid/os/BinderUtils$LifecycleBinderWrapper;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/os/BinderUtils$LifecycleBinderWrapper;->a(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
