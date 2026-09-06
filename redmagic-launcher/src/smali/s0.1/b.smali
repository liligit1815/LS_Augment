.class public final synthetic Ls0/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LI/a;


# instance fields
.field public final synthetic a:Landroidx/window/layout/adapter/sidecar/SidecarCompat;

.field public final synthetic b:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroidx/window/layout/adapter/sidecar/SidecarCompat;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls0/b;->a:Landroidx/window/layout/adapter/sidecar/SidecarCompat;

    .line 5
    .line 6
    iput-object p2, p0, Ls0/b;->b:Landroid/app/Activity;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls0/b;->a:Landroidx/window/layout/adapter/sidecar/SidecarCompat;

    .line 2
    .line 3
    iget-object p0, p0, Ls0/b;->b:Landroid/app/Activity;

    .line 4
    .line 5
    check-cast p1, Landroid/content/res/Configuration;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Landroidx/window/layout/adapter/sidecar/SidecarCompat;->d(Landroidx/window/layout/adapter/sidecar/SidecarCompat;Landroid/app/Activity;Landroid/content/res/Configuration;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
